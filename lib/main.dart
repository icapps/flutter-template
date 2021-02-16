import 'package:flutter/material.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/env/os_config.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/niddler.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initNiddler();

  await OsConfig.init();
  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: true,
    showFullErrorMessages: true,
  );
  FlavorConfig(
    flavor: Flavor.DEV,
    name: 'DEV',
    color: Colors.red,
    values: values,
  );
  // ignore: avoid_print
  print('Starting app from main.dart');
  await configureDependencies(Environments.DEV);
  runApp(MyApp());
}
