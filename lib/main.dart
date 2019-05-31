import 'package:flutte_template/app.dart';
import 'package:flutte_template/di/injector.dart' as kiwi;
import 'package:flutte_template/niddler.dart';
import 'package:flutte_template/util/env/flavor_config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initNiddler();

  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: true,
  );
  FlavorConfig(
    flavor: Flavor.DEV,
    name: 'DEV',
    color: Colors.red,
    values: values,
  );
  kiwi.setupDependencyTree();
  runApp(MyApp());
}
