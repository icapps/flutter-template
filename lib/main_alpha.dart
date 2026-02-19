import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/di/injectable.dart' as di;
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/model/data/environment/sentry_config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/logging/sentry_performance_logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.alpha,
      name: 'ALPHA',
      color: Colors.amber,
      values: values,
    );
    await configureDependencies(Environments.prod);
    await SentryFlutter.init(
      (options) => SentryConfig.alpha(options),
      appRunner: () {
        di.getIt<SentryPerformanceLogger>().startAppLoadTransaction();
        runApp(const MyApp());
      },
    );
  });
}
