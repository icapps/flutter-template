import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/injector.dart' as kiwi;
import 'package:flutter_template/niddler.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
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
