import 'package:kiwi/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/extension/kiwi_extensions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  await KiwiContainer().init();
  runApp(MyApp());
}
