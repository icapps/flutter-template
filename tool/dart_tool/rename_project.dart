import 'dart:io';

const originalProjectName = 'test';

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
  final dir = Directory('lib');
  dir
      .listSync(recursive: true)
      .where((element) => !Directory(element.path).existsSync())
      .forEach((element) => _replaceInFile(element.path, "import 'package:$originalProjectName/", "import 'package:$packageName/"));

  Logger.info('Replace text in test files ...');
  final testDir = Directory('test');
  testDir
      .listSync(recursive: true)
      .where((element) => !Directory(element.path).existsSync())
      .where((element) => !element.path.endsWith('.png'))
      .forEach((element) => _replaceInFile(element.path, "import 'package:$originalProjectName/", "import 'package:$packageName/"));
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
