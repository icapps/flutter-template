import 'dart:io';

main() {
  print('Start a check to make sure we have a test file for every sourcecode file');
  final sourceCodeFolder = Directory('lib');
  final testSourceCodeFolder = Directory('test');

  if (!sourceCodeFolder.existsSync()) {
    throw ArgumentError('lib dir not found');
  } else if (!testSourceCodeFolder.existsSync()) {
    throw ArgumentError('test dir not found');
  }
  final sourceCodeTodoFiles = List<File>();
  final sourceFiles = getFiles(sourceCodeFolder);

  print('');
  print('Detected ${sourceFiles.length} source files (with excluded folders/files: .g.dart, **dummy_service.dart, lib/vendor/**, lib/util/locale**)');

  final sourceCodeFiles = sourceFiles.where((file) {
    final path = file.path;
    if (path.endsWith('.g.dart')) {
      return false;
    } else if (path.endsWith('dummy_service.dart')) {
      return false;
    } else if (path.startsWith('lib/vendor/')) {
      return false;
    } else if (path.startsWith('lib/util/locale')) {
      return false;
    }
    return true;
  });
  print('');
  print('Detected ${sourceCodeFiles.length} source files');

  sourceCodeFiles.forEach((file) {
    final cleanupFile = file.path.replaceFirst('lib/', '').replaceFirst('.dart', '');
    final testFile = File('test/${cleanupFile}_test.dart');
    if (!testFile.existsSync()) {
      sourceCodeTodoFiles.add(testFile);
    }
  });
  print('');
  print('Detected ${sourceCodeTodoFiles.length} untested files');

  print('');
  print('Filter ${excludedFiles.length} untested files');
  sourceCodeTodoFiles.removeWhere((file) => excludedFiles.contains(file.path.replaceFirst('test/', '').replaceFirst('_test.dart', '.dart')));

  print('');
  print('Detected ${sourceCodeTodoFiles.length} untested files after filter');

  print('');
  print('There are no test yet created for:');
  (sourceCodeTodoFiles..sort((file1, file2) => file1.path.compareTo(file2.path))).forEach((file) {
    print('${file.path}');
  });
  print('');
  if (sourceCodeTodoFiles.isNotEmpty) {
    print('You need to create ${sourceCodeTodoFiles.length} extra test files');
    exit(-1);
  }
}

List<File> getFiles(Directory directory) {
  final files = List<File>();
  final data = directory.listSync();
  for (final info in data) {
    final file = File(info.path);
    final dir = Directory(info.path);
    if (dir.existsSync()) {
      files.addAll(getFiles(dir));
    } else {
      files.add(file);
    }
  }
  return files;
}

const excludedFiles = [
  // Entry points
  'main.dart',
  'main_alpha.dart',
  'main_beta.dart',
  'main_dummy.dart',
  // App
  'app.dart',
  // Niddler
  'niddler.dart',
];
