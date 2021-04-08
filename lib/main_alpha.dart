import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OsInfo.init();
  const values = FlavorValues(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    logNetworkInfo: false,
    showFullErrorMessages: true,
  );
  FlavorConfig(
    flavor: Flavor.ALPHA,
    name: 'ALPHA',
    color: Colors.amber,
    values: values,
  );
  await configureDependencies(Environments.PROD);
  runApp(MyApp());
}
