import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/env/os_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OsConfig.init();
  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: false,
    showFullErrorMessages: false,
  );
  FlavorConfig(
    flavor: Flavor.PROD,
    name: 'PROD',
    color: Colors.transparent,
    values: values,
  );
  print('Starting app from main_prod.dart');
  await configureDependencies(Environments.PROD);
  runApp(MyApp());
}
