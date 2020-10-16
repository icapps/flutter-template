import 'dart:io';

void main() {
  Logger.info('Enter Dart Package Name:');
  final packageName = stdin.readLineSync();
  _renamePackage(packageName);
}

void _renamePackage(String packageName) {
  Logger.info('Using `$packageName` as your new dart package name');
  Logger.info('Renaming Pubspec.yaml ...');
  _replaceInFile('pubspec.yaml', 'name: flutter_template', 'name: $packageName');

  Logger.info('Renaming files ...');
  final dir = Directory('lib');
  dir
      .listSync(recursive: true)
      .where((element) => !Directory(element.path).existsSync())
      .forEach((element) => _replaceInFile(element.path, "import 'package:flutter_template/", "import 'package:$packageName/"));
}

void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

class Logger {
  Logger._();

  static void debug(value) => print(value); // ignore: avoid_print

  static void info(value) => print(value); // ignore: avoid_print
}
