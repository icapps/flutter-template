import 'dart:io';

void main() {
  printMessage('Start a check to make sure we have a test file for every sourcecode file');
  final sourceCodeFolder = Directory('lib');
  final testSourceCodeFolder = Directory('test');

  if (!sourceCodeFolder.existsSync()) {
    throw ArgumentError('lib dir not found');
  } else if (!testSourceCodeFolder.existsSync()) {
    throw ArgumentError('test dir not found');
  }
  final sourceCodeTodoFiles = <File>[];
  final sourceFiles = getFiles(sourceCodeFolder);

  printMessage('');
  printMessage('Detected ${sourceFiles.length} source files (with excluded folders/files: .g.dart, **dummy_service.dart, lib/vendor/**, lib/util/locale**, lib/webservice/)');

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
    } else if (path.startsWith('lib/webservice')) {
      return false;
    } else if (path.startsWith('lib/model/exceptions/')) {
      return false;
    }
    for (final excludedFile in excludedEndsWithFiles) {
      if (path.endsWith(excludedFile)) return false;
    }
    return true;
  });
  printMessage('');
  printMessage('Detected ${sourceCodeFiles.length} source files');

  for (final file in sourceCodeFiles) {
    final cleanupFile = file.path.replaceFirst('lib/', '').replaceFirst('.dart', '');
    final testFile = File('test/${cleanupFile}_test.dart');
    if (!testFile.existsSync()) {
      sourceCodeTodoFiles.add(testFile);
    }
  }
  printMessage('');
  printMessage('Detected ${sourceCodeTodoFiles.length} untested files');

  printMessage('');
  printMessage('Exclude ${excludedFiles.length} files (no tests needed for these)');
  sourceCodeTodoFiles.removeWhere((file) => excludedFiles.contains(file.path.replaceFirst('test/', '').replaceFirst('_test.dart', '.dart')));

  printMessage('');
  printMessage('Detected ${sourceCodeTodoFiles.length} untested files after filter');

  printMessage('');
  printMessage('There are no test yet created for:');
  printMessage('');
  for (final file in (sourceCodeTodoFiles..sort((file1, file2) => file1.path.compareTo(file2.path)))) {
    printMessage(file.path);
  }
  printMessage('');
  if (sourceCodeTodoFiles.isNotEmpty) {
    printMessage('You need to create ${sourceCodeTodoFiles.length} extra test files');
    exit(-1);
  }
}

List<File> getFiles(Directory directory) {
  final files = <File>[];
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
  'main_prod.dart',
  // App
  'app.dart',
  // Navigation
  'navigator/main_navigation.dart',
  // Niddler
  'niddler.dart',
  'di/injector.dart',
  //Util
  'util/app_constants.dart',
  'util/keys.dart',
  'util/license.dart',
  'util/route/fade_in_route.dart',
  //Styles
  'styles/theme_colors.dart',
  'styles/theme_data.dart',
  'styles/theme_dimens.dart',
  'styles/theme_fonts.dart',
  'styles/theme_text_styles.dart',
];

const excludedEndsWithFiles = [
  '_repo.dart',
  '_storing.dart',
];

void printMessage(String message){
  // ignore: avoid_print
  print(message);
}