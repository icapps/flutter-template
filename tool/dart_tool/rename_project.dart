import 'dart:io';

const originalProjectName = 'flutter_template';

void main() {
  Logger.info('Enter Dart Package Name:');
  final packageName = stdin.readLineSync();
  _renamePackage(packageName);
  _packagesGet();
}

void _renamePackage(String packageName) {
  Logger.info('Using `$packageName` as your new dart package name');
  Logger.info('Replace text in Pubspec.yaml ...');
  _replaceInFile('pubspec.yaml', 'name: $originalProjectName', 'name: $packageName');

  Logger.info('Replace text in files ...');
  Directory('lib').listSync(recursive: true).where((element) => !Directory(element.path).existsSync()).forEach((element) {
    _replaceInFile(element.path, "import 'package:$originalProjectName/", "import 'package:$packageName/");
    _replaceImportInFile(element.path, originalProjectName, packageName);
    _renameFile(element.path, packageName);
  });

  Logger.info('Replace text in test files ...');
  Directory('test').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, "import 'package:$originalProjectName/", "import 'package:$packageName/");
    _replaceImportInFile(element.path, originalProjectName, packageName);
    _renameFile(element.path, packageName);
  });
}

void _packagesGet() {
  _executeCommand('flutter', ['packages', 'get']);
}

/// ==============
/// UTIL FUNCTIONS
/// ==============
void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

void _replaceImportInFile(String path, String originalString, String newString) {
  final file = File(path);
  final originalLines = file.readAsLinesSync();
  final newContent = originalLines.map((element) {
    if (element.startsWith("import 'package:$newString/")) return element.replaceAll(originalString, newString);
    return element;
  });
  file.writeAsStringSync(newContent.join('\n'));
}

void _renameFile(String path, String newPackageName) {
  final oldFile = File(path);
  final oldFileContent = oldFile.readAsStringSync();
  oldFile.deleteSync();
  final newPath = path.replaceAll(originalProjectName, newPackageName);
  File(newPath)
    ..createSync()
    ..writeAsStringSync(oldFileContent);
}

void _executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    Logger.debug('Executing command:');
    Logger.info('$fullCommand');
    final result = Process.runSync(cmd, params);
    final output = result.stdout;
    if (output.toString().isNotEmpty) {
      Logger.debug('$output');
    }
  } catch (e) {
    Logger.error('\nFailed to execute command: $fullCommand\n$e');
    exit(-1);
  }
}

class Logger {
  Logger._();

  static void debug(value) => print(value); // ignore: avoid_print

  static void info(value) => print(value); // ignore: avoid_print
  static void error(value) => print(value); // ignore: avoid_print
}
