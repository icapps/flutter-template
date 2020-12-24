import 'dart:io';

void main(List<String> args) {
  bool keepTestDir;
  if (args.isEmpty || (args[0] != 'true' && args[0] != 'false')) {
    do {
      final result = stdin.readLineSync();
      final valid = result == 'yes' || result == 'y' || result == 'no' || result == 'n';
      if (valid) {
        keepTestDir = result == 'yes' || result == 'y';
      }
    } while (keepTestDir == null);
  }
  final testDir = Directory('test');
  final libDir = Directory('lib');
  if (!keepTestDir && testDir.existsSync()) {
    testDir.deleteSync(recursive: true);
    Logger.debug('Removed the test directory');
  }
  Logger.debug('Removing files');
  removeBoilerplateFilesFromDirectory(testDir);
  removeBoilerplateFilesFromDirectory(libDir);
  Logger.debug('Removed files');

  Logger.debug('Removing import references');
  replaceBoilerplateReferencesFromDirectory(testDir);
  replaceBoilerplateReferencesFromDirectory(libDir);
  Logger.debug('Removed import references');
}

void removeBoilerplateFilesFromDirectory(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (File(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeDirectories.forEach((removeDir) {
      if (element.path == removeDir) {
        element.deleteSync(recursive: true);
      }
    });
  });
}

void replaceBoilerplateReferencesFromDirectory(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeCodeLines.forEach((import) {
      _replaceInFile(element.path, '$import\n', '');
    });
  });
}

void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

final removeCodeLines = [
  "import 'package:flutter_template/model/database/todo/db_todo_table.dart';",
  "import 'package:flutter_template/model/webservice/todo/todo.dart';",
];

final removeDirectories = [
  'lib/database/todo',
  'lib/model/database/todo',
  'lib/model/webservice/todo',
  'lib/repository/todo',
  'lib/screens/todo',
  'lib/viewmodel/todo',
  'lib/webservice/todo',
  'lib/widget/todo',
];

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
