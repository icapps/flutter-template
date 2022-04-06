import 'dart:io';

const originalProjectName = 'flutter_template';
const originalClassNamePrefix = 'FlutterTemplate';
const originalIOSBundleIdentifier = 'com.icapps.fluttertemplate';
const originalAndroidPackageName = 'com.icapps.fluttertemplate';
const originalAndroidFolderPath = 'com/icapps/fluttertemplate';
const originalAppName = 'Flutter Template';
const originalDescription = 'A Flutter Template to get started quickly';

void main(List<String> args) {
  final type = args[0];
  final alias = args[1];
  final password = args[2];
  final originalContent = '''    $type {
      storeFile file("../keystore/$type.keystore")
      storePassword "your-store-alias"
      keyAlias "your-key-alias"
      keyPassword "your-key-password"
    }''';
  final newContent = '''    $type {
      storeFile file("../keystore/$type.keystore")
      storePassword "$password"
      keyAlias "$alias"
      keyPassword "$password"
    }''';
  _replaceInFile('android/app/build.gradle', originalContent, newContent);
}

/// ==============
/// UTIL FUNCTIONS
/// ==============
void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) {
    Logger.error('❌❌❌ $path does not exist');
    return;
  }
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
