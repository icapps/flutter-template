import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/niddler.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  await KiwiContainer.init();
  runApp(MyApp());
}
