import 'dart:io';

void main() {
  bool? enableFirebase;
  do {
    Logger.info('\nDo you want to enable firebase? (yes/no)');
    final result = stdin.readLineSync();
    final validResult = result == 'y' || result == 'n' || result == 'yes' || result == 'no';
    if (validResult) {
      enableFirebase = result == 'y' || result == 'yes';
    }
  } while (enableFirebase == null);
  if (enableFirebase) {
    Logger.debug('You can not enable firebase again with this plugin. only remove firebase');
    exit(0);
  }
  _removeLineInFileStartWith('pubspec.yaml', '  firebase_analytics');
  _removeLineInFileStartWith('pubspec.yaml', '  firebase_core');
  _removeLineInFileStartWith('pubspec.yaml', '  firebase_crashlytics');
  replaceInFile(
      'lib/main_common.dart',
      '''
Future<void> _setupCrashLogging({required bool enabled}) async {
  if (enabled) {
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enabled);
    unawaited(FirebaseCrashlytics.instance.sendUnsentReports());
  }

  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    if (enabled) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    originalOnError?.call(errorDetails);
  };
}

''',
      '\n');
}

void replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

void _removeLineInFileStartWith(String path, String startWithString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsLinesSync();
  final newContent = <String>[];
  for (final line in original) {
    if (line.startsWith(startWithString)) continue;
    newContent.add(line);
  }
  file.writeAsStringSync(newContent.join('\n'));
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
