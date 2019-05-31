import 'package:flutte_template/app.dart';
import 'package:flutte_template/di/injector.dart' as kiwi;
import 'package:flutte_template/util/env/flavor_config.dart';
import 'package:flutter/material.dart';

void main() {
  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: false,
  );
  FlavorConfig(
    flavor: Flavor.BETA,
    name: 'BETA',
    color: Colors.blue,
    values: values,
  );
  kiwi.setupDependencyTree();
  runApp(MyApp());
}
