import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/interceptor/combining_smart_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies(String environment) async {
  // ignore: avoid_print
  print('Using environment: $environment');
  await $initGetIt(getIt, environment: environment);
  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs {
    if (FlavorConfig.isInTest()) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues(<String, dynamic>{});
    }
    return SharedPreferences.getInstance();
  }

  FlutterSecureStorage get storage => const FlutterSecureStorage();

  Connectivity get connectivity => Connectivity();

  QueryExecutor get executor => VmDatabase.memory();

  CombiningSmartInterceptor provideCombiningSmartInterceptor(
    NetworkLogInterceptor logInterceptor,
    NetworkAuthInterceptor authInterceptor,
    NetworkErrorInterceptor errorInterceptor,
    NetworkRefreshInterceptor refreshInterceptor,
  ) =>
      CombiningSmartInterceptor()..addInterceptor(authInterceptor)..addInterceptor(refreshInterceptor)..addInterceptor(errorInterceptor)..addInterceptor(logInterceptor);

  Dio provideDio(CombiningSmartInterceptor networkInterceptor) {
    final dio = Dio();
    dio.options.baseUrl = FlavorConfig.instance.values.baseUrl;
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson; // ignore: avoid_as
    dio.interceptors.add(networkInterceptor);
    return dio;
  }

  FlutterTemplateDatabase provideFlutterTemplateDatabase(DatabaseConnection databaseConnection) => FlutterTemplateDatabase.connect(databaseConnection);

  @preResolve
  Future<DatabaseConnection> provideDatabaseConnection() async {
    if (FlavorConfig.isInTest()) return null;
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    if ((FlavorConfig.isDev() || FlavorConfig.isDummy()) && file.existsSync()) {
      file.deleteSync();
      FlutterTemplateLogger.logVerbose('Databasefile `db.sqlite` is deleted');
    }
    final receivePort = ReceivePort();

    await Isolate.spawn(
      _startBackground,
      _IsolateStartRequest(receivePort.sendPort, file.path),
    );

    // ignore: avoid_as
    final isolate = await receivePort.first as MoorIsolate;
    return isolate.connect();
  }
}

void _startBackground(_IsolateStartRequest request) {
  final executor = VmDatabase(File(request.targetPath));
  final moorIsolate = MoorIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );
  request.sendMoorIsolate.send(moorIsolate);
}

class _IsolateStartRequest {
  final SendPort sendMoorIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) => compute<String, dynamic>(_parseAndDecode, text);
