import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.beta,
      name: 'BETA',
      color: Colors.blue,
      values: values,
      supportsTheming: true,
    );
    await configureDependencies(Environments.prod);
    runApp(const MyApp());
  });
}
