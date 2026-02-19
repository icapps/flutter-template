import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/di/injectable.dart' as di;
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/util/env/sentry_config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/logging/sentry_performance_logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initArchitecture();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
      dsn: '',
    );
    FlavorConfig(
      flavor: Flavor.prod,
      name: 'PROD',
      color: Colors.transparent,
      values: values,
    );
    await configureDependencies(Environments.prod);
    await SentryFlutter.init(
      (options) => SentryConfig.prod(options),
      appRunner: () {
        di.getIt<SentryPerformanceLogger>().startAppLoadTransaction();
        runApp(const MyApp());
      },
    );
  });
}
