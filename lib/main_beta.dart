import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initArchitecture();
  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: false,
    showFullErrorMessages: true,
  );
  FlavorConfig(
    flavor: Flavor.BETA,
    name: 'BETA',
    color: Colors.blue,
    values: values,
  );
  await configureDependencies(Environments.PROD);
  runApp(MyApp());
}
