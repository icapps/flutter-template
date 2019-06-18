import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/injector.dart' as kiwi;
import 'package:flutter_template/util/env/flavor_config.dart';
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
