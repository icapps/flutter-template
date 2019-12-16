import 'package:flutter/material.dart';
import 'package:niddler_dart/niddler_dart.dart';

Future<void> initNiddler() async {
  WidgetsFlutterBinding.ensureInitialized();

  final niddlerBuilder = NiddlerBuilder()
    ..port = 0
    ..serverInfo = NiddlerServerInfo('FlutterTemplate', 'Flutter Template')
    ..bundleId = 'com.icapps.fluttertemplate'
    ..maxCacheSize = 10 * 1024 * 1024;
  final niddler = niddlerBuilder.build();

  print('Starting niddler');
  await niddler.start();
  niddler.install();
  print('Niddler is running');
}
