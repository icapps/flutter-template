import 'dart:io';

const packageName = 'flutter_template';

void main() {
  Logger.debug('First create a file with all other files imported so flutter test coverage uses all files');
  final imports = Directory('lib').listSync(recursive: true).where((element) {
    if (Directory(element.path).existsSync()) return false;
    if (!element.path.endsWith('.dart')) return false;
    if (element.path.endsWith('.g.dart')) return false;
    if (element.path.endsWith('_web.dart')) return false;
    if (element.path.contains('/widgetbook/')) return false;
    return true;
  }).map((element) {
    final importPath = element.path.replaceFirst('lib', packageName);
    return "import 'package:$importPath';";
  });
  final testFile = File('test/coverage_helper_test.dart');
  if (!testFile.existsSync()) {
    testFile.createSync();
  }
  final sortedImports = imports.toList()..sort((e1, e2) => e1.compareTo(e2));
  final content = '${sortedImports.join('\n')}\nvoid main(){}';
  testFile.writeAsStringSync(content);
  Logger.debug('Created the test/coverage_helper_test.dart');
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print
}
