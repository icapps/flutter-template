import 'package:niddler_flutter/niddler.dart';
import 'package:niddler_flutter/niddler_flutter.dart';

Future<void> initNiddler() async {
  final niddlerBuilder = NiddlerBuilder()
    ..port = 0
    ..serverInfo = NiddlerServerInfo('FlutterTemplate', 'Flutter Template')
    ..bundleId = 'com.icapps.fluttertemplate'
    ..maxCacheSize = 10 * 1024 * 1024;
  final niddler = niddlerBuilder.build();

  print('Starting niddler');
  await niddler.start();
  NiddlerInjector.install(niddler);
  print('Niddler is running');
}
