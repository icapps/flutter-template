import 'dart:async';

import 'package:file_local_storage_inspector/file_local_storage_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:path_provider/path_provider.dart';
import 'package:preferences_local_storage_inspector/preferences_local_storage_inspector.dart';
import 'package:secure_storage_local_storage_inspector/secure_storage_local_storage_inspector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_inspector/storage_inspector.dart';

Future<void> initAllStorageInspectors() async {
  await _initLocalStorageInspector((driver) async {
    driver.addKeyValueServer(SecureStorageKeyValueServer(getIt.get<FlutterSecureStorage>(), 'Secure Storage', icon: secureStorageIcon));
    driver.addKeyValueServer(PreferencesKeyValueServer(getIt.get<SharedPreferences>(), 'Shared preferences'));
    if (!kIsWeb) {
      driver.addFileServer(DefaultFileServer((await getApplicationDocumentsDirectory()).path, 'App documents'));
      driver.addFileServer(DefaultFileServer((await getTemporaryDirectory()).path, 'Cache files'));
    }
  });
}

Future<void> _initLocalStorageInspector(
  FutureOr<void> Function(StorageServerDriver) configureServers,
) async {
  if (!kDebugMode) return;

  final driver = StorageServerDriver(
    bundleId: 'com.icapps.flutter_template',
    port: 0,
    icon: 'flutter',
  );

  await configureServers(driver);

  const paused = bool.fromEnvironment('storage_inspector_wait');
  staticLogger.d('Starting local storage inspector. Waiting for unpause? $paused');

  await driver.start(paused: paused);
}

const secureStorageIcon =
    r"""<svg height="16" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd" stroke="#afb1b3" transform="translate(4 2)"><path d="m11.4444444 7c.5522848 0 1 .44771525 1 1v6.8888889c0 .5522847-.4477152 1-1 1h-10.4444444c-.55228475 0-1-.4477153-1-1v-6.8888889c0-.55228475.44771525-1 1-1zm-5.44444441 1.19999999c-1.1045695 0-2 .8954305-2 2.00000001 0 .7402524.40216612 1.3865739.99992751 1.7323937l.0000725 2.0676063h2l.00107749-2.0681882c.59720711-.3459625.9989225-.9919743.9989225-1.7318118 0-1.10456951-.89543051-2.00000001-2-2.00000001z" fill="#afb1b3"/><path d="m2 7v-3c0-2.209139 1.790861-4 4-4s4 1.790861 4 4v3" stroke-width="1.5"/></g></svg>""";
