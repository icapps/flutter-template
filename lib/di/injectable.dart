import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/interceptor/combining_smart_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart';
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
)
Future<void> configureDependencies(String environment) async {
  // ignore: avoid_print
  print('Using environment: $environment');
  await $initGetIt(getIt, environment: environment);
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
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) => compute<String, dynamic>(_parseAndDecode, text);
