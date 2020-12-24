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
  if (!keepTestDir && testDir.existsSync()) {
    testDir.deleteSync(recursive: true);
  }
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
