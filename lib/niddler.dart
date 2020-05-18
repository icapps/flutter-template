import 'package:niddler_dart/niddler_dart.dart';

Future<void> initNiddler() async {
  final niddlerBuilder = NiddlerBuilder()
    ..port = 0
    ..serverInfo = NiddlerServerInfo('Flutter Template', 'Flutter Template')
    ..bundleId = 'com.icapps.flutter_template'
    ..maxCacheSize = 10 * 1024 * 1024;
  final niddler = niddlerBuilder.build();
  // ignore: avoid_print
  print('Starting niddler');
  await niddler.start();
  niddler.install();
  // ignore: avoid_print
  print('Niddler is running');
}
