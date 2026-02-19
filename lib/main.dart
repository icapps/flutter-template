import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart' as di;
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/util/env/sentry_config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/inspector/database_inspector.dart';
import 'package:flutter_template/util/inspector/local_storage_inspector.dart';
import 'package:flutter_template/util/inspector/niddler.dart';
import 'package:flutter_template/util/logging/sentry_performance_logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
      dsn: '',
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await di.configureDependencies(Environments.dev);
    await addDatabaseInspector();
    await initAllStorageInspectors();

    await SentryFlutter.init(
      (options) => SentryConfig.development(options),
      appRunner: () {
        di.getIt<SentryPerformanceLogger>().startAppLoadTransaction();
        runApp(const MyApp());
      },
    );
  });
}
