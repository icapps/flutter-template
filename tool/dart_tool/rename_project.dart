import 'dart:io';

void main() {
  Logger.info('Enter Dart Package Name:');
  final packageName = stdin.readLineSync();
  renamePackage(packageName);
}

void renamePackage(String packageName) {
  Logger.info('Using `$packageName` as your new dart package name');
  final dir = Directory('lib');
  dir.listSync(recursive: true).where((element) => !Directory(element.path).existsSync()).forEach((element) {
    final file = File(element.path);
    final original = file.readAsStringSync();
    final newContent = original.replaceAll("import 'package:flutter_template/", "import 'package:$packageName/");
    file.writeAsStringSync(newContent);
  });
}

class Logger {
  Logger._();

  static void debug(value) => print(value); // ignore: avoid_print

  static void info(value) => print(value); // ignore: avoid_print
}
