import 'dart:io';

const packageName = 'flutter_template';

void main() {
  Logger.debug('====');
  Logger.debug('First create a file with all other files imported so flutter test coverage uses all files');
  Logger.debug('====');

  final imports = Directory('lib').listSync(recursive: true).where((element) {
    if (Directory(element.path).existsSync()) return false;
    if (element.path.endsWith('.g.dart')) return false;
    if (element.path.endsWith('_web.dart')) return false;
    if (element.path.endsWith('generated_plugin_registrant.dart')) return false;
    return true;
  }).map((element) {
    final importPath = element.path.replaceFirst('lib', packageName);
    return 'import "package:$importPath";';
  });
  final testFile = File('test/coverage_helper_test.dart');
  if (!testFile.existsSync()) {
    testFile.createSync();
  }
  final content = '${imports.join('\n')}\nvoid main(){}';
  testFile.writeAsStringSync(content);

  Logger.debug('====');
  Logger.debug('Finished');
  Logger.debug('====');
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print
}
