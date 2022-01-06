import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/inspector/database_inspector.dart';
import 'package:flutter_template/util/inspector/local_storage_inspector.dart';
import 'package:flutter_template/util/inspector/niddler.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_inspector/storage_inspector.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);
    await addDatabaseInspector();
    await initLocalStorageInspector((driver) async {
      driver.addKeyValueServer(SecureStorageKeyValueServer(GetIt.I.get<FlutterSecureStorage>(), 'Secure Storage', icon: secureStorageIcon));
      driver.addKeyValueServer(PreferencesKeyValueServer(GetIt.I.get<SharedPreferences>(), 'Shared preferences'));
      driver.addFileServer(DefaultFileServer((await getApplicationDocumentsDirectory()).path, 'App documents'));
      driver.addFileServer(DefaultFileServer((await getTemporaryDirectory()).path, 'Cache files'));
    });

    runApp(const MyApp());
  }, enableCrashLogging: false);
}
