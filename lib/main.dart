import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/niddler.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/extension/kiwi_extensions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initNiddler();

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
  await KiwiContainer().init();
  runApp(MyApp());
}
