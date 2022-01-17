import 'dart:io';

const originalProjectName = 'flutter_template';
const originalClassNamePrefix = 'FlutterTemplate';
const originalIOSBundleIdentifier = 'com.icapps.fluttertemplate';
const originalAndroidPackageName = 'com.icapps.fluttertemplate';
const originalAndroidFolderPath = 'com/icapps/fluttertemplate';
const originalAppName = 'Flutter Template';
const originalDescription = 'A Flutter Template to get started quickly';

void main() {
  Logger.info('Enter application name (eg: My Cool App):');
  final appName = stdin.readLineSync();
  Logger.info('Enter description for the pubspec.yaml:');
  final description = stdin.readLineSync();
  Logger.info('Enter Dart Package Name (eg: my_cool_app):');
  final dartPackageName = stdin.readLineSync();
  Logger.info('Enter Dart Class Name Prefix (eg: MCA):');
  final classNamePrefix = stdin.readLineSync();

  String? androidPackageName;
  String? iosBundleIdentifier;
  do {
    Logger.info('\nEnter Android Package Name / iOS Bundle Identifier');
    Logger.info('No uppercase & no underscores:');
    final result = stdin.readLineSync();
    if (result == null) continue;
    final validResult = result == result.toLowerCase() && !result.contains('_');
    if (validResult) {
      iosBundleIdentifier = result;
      androidPackageName = result;
    }
  } while (iosBundleIdentifier == null && androidPackageName == null);

  bool? specificAppCenterIds;
  do {
    Logger.info('\nDo you want to specify the AppCenter ids?\n"no" will use the default config: $classNamePrefix-iOS/Android-Alpha/Beta (yes/no)');
    final result = stdin.readLineSync();
    final validResult = result == 'y' || result == 'n' || result == 'yes' || result == 'no';
    if (validResult) {
      specificAppCenterIds = result == 'y' || result == 'yes';
    }
  } while (specificAppCenterIds == null);

  bool? replaceReadmeContent;
  do {
    Logger.info('\nDo you want to replace the README.md content? (yes/no)');
    final result = stdin.readLineSync();
    final validResult = result == 'y' || result == 'n' || result == 'yes' || result == 'no';
    if (validResult) {
      replaceReadmeContent = result == 'y' || result == 'yes';
    }
  } while (replaceReadmeContent == null);

  if (classNamePrefix == null || androidPackageName == null || iosBundleIdentifier == null || appName == null || dartPackageName == null || description == null) {
    Logger.info('\nWe found some invalid values. Please try again. Your codebase is not yet altered.');
    return;
  }

  _renameAppCenterIds(classNamePrefix, specificAppCenterIds);
  _renameAndroidPackageName(androidPackageName);
  _renameiOSBundleIdentifier(iosBundleIdentifier);
  _renameNiddlerPackageName(androidPackageName, iosBundleIdentifier, appName);
  _renameAppName(appName);
  _renamePackage(dartPackageName, description, classNamePrefix);
  _renameTools(dartPackageName, description, classNamePrefix, appName, iosBundleIdentifier, androidPackageName);
  _renameReadMe(replaceReadmeContent, dartPackageName, description, classNamePrefix, appName, iosBundleIdentifier, androidPackageName);
  _packagesGet();
  _performFinalCheck();
  _renameTools(dartPackageName, description, classNamePrefix, appName, iosBundleIdentifier, androidPackageName, force: true);
  Logger.debug('');
  Logger.debug('rename_project.dart finished successfully');
}

void _renameAppCenterIds(String classNamePrefix, bool specificAppCenterIds) {
  if (specificAppCenterIds) {
    Logger.info('Enter iOS AppCenter Alpha id: (Default is $classNamePrefix-iOS-Alpha)');
    final appCenterIosAlphaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.iosAlpha, classNamePrefix, value: appCenterIosAlphaId);
    Logger.info('Enter iOS AppCenter Beta id: (Default is $classNamePrefix-iOS-Beta)');
    final appCenterIosBetaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.iosBeta, classNamePrefix, value: appCenterIosBetaId);
    Logger.info('Enter iOS AppCenter Prod id: (Default is $classNamePrefix-iOS)');
    final appCenterIosProdId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.iosProd, classNamePrefix, value: appCenterIosProdId);

    Logger.info('Enter Android AppCenter Alpha id: (Default is $classNamePrefix-Android-Alpha)');
    final appCenterAndroidAlphaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.androidAlpha, classNamePrefix, value: appCenterAndroidAlphaId);
    Logger.info('Enter Android AppCenter Beta id: (Default is $classNamePrefix-Android-Beta)');
    final appCenterAndroidBetaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.androidBeta, classNamePrefix, value: appCenterAndroidBetaId);
    Logger.info('Enter Android AppCenter Prod id: (Default is $classNamePrefix-Android)');
    final appCenterAndroidProdId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.androidProd, classNamePrefix, value: appCenterAndroidProdId);
  } else {
    Logger.info('Replace the AppCenter ids with default values...');
    _renameFastlaneAppCenterIds(AppCenterApp.iosAlpha, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.iosBeta, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.iosProd, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.androidAlpha, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.androidBeta, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.androidProd, classNamePrefix);
  }
}

void _renameAndroidPackageName(String androidPackageName) {
  Logger.info('Replace the android package name ...');
  _replaceInFile('android/app/build.gradle', originalAndroidPackageName, androidPackageName);
  Directory('android/app/src/main').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
  });
  Directory('android/app/src/main/kotlin').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    _renameKotlinFile(element.path, androidPackageName);
  });
  _deleteOldKotlinFiles(androidPackageName);
  Directory('lib').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
  });
  final testDir = Directory('test');
  if (testDir.existsSync()) {
    testDir.listSync(recursive: true).where((element) {
      if (element.path.endsWith('.png')) return false;
      if (element.path.endsWith('.DS_Store')) return false;
      if (Directory(element.path).existsSync()) return false;
      if (element.path.contains('.DS_Store')) return false;
      return true;
    }).forEach((element) {
      _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
    });
  }
}

void _deleteOldKotlinFiles(String androidPackageName) {
  if (androidPackageName.startsWith('com.icapps')) {
    Directory('android/app/src/main/kotlin/$originalAndroidFolderPath').deleteSync();
  } else if (androidPackageName.startsWith('com')) {
    Directory('android/app/src/main/kotlin/$originalAndroidFolderPath').deleteSync();
    Directory('android/app/src/main/kotlin/com/icapps').deleteSync();
  } else {
    Directory('android/app/src/main/kotlin/$originalAndroidFolderPath').deleteSync();
    Directory('android/app/src/main/kotlin/com/icapps').deleteSync();
    Directory('android/app/src/main/kotlin/com').deleteSync();
  }
}

void _renameiOSBundleIdentifier(String iosBundleIdentifier) {
  Logger.info('Replace the ios bundle identifier ...');
  _replaceInFile('fastlane/Fastfile', originalIOSBundleIdentifier, iosBundleIdentifier);
  Directory('ios/Configuration').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
  Directory('ios/Runner').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
  Directory('lib').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
  });
  final testDir = Directory('test');
  if (testDir.existsSync()) {
    testDir.listSync(recursive: true).where((element) {
      if (element.path.endsWith('.png')) return false;
      if (element.path.endsWith('.DS_Store')) return false;
      if (Directory(element.path).existsSync()) return false;
      if (element.path.contains('.DS_Store')) return false;
      return true;
    }).forEach((element) {
      _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
    });
  }
}

void _renameAppName(String appName) {
  Logger.info('Replace the app name ...');
  _replaceInFile('fastlane/Fastfile', originalAppName, appName);
  Directory('ios/Configuration').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.contains('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAppName, appName);
  });
  Directory('android/app/src').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.contains('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalAppName, appName);
  });
}

void _renameNiddlerPackageName(String androidPackageName, String iosBundleIdentifier, String appName) {
  Logger.info('Replace text in lib/util/inspector/niddler.dart...');
  _replaceInFile('lib/util/inspector/niddler.dart', originalAndroidPackageName, androidPackageName);
  _replaceInFile('lib/util/inspector/niddler.dart', originalIOSBundleIdentifier, iosBundleIdentifier);
  _replaceInFile('lib/util/inspector/niddler.dart', originalAppName, appName);
}

void _renamePackage(String packageName, String description, String classNamePrefix) {
  Logger.info('Replace the description & name in the pubspec.yaml...');
  _replaceInFile('pubspec.yaml', 'name: $originalProjectName', 'name: $packageName');
  _replaceInFile('pubspec.yaml', 'description: $originalDescription', 'description: $description');
  _replaceInFile('coverage/filter_test_coverage.dart', originalClassNamePrefix, classNamePrefix);
  _replaceInFile('coverage/lcov.info', originalProjectName, packageName);

  Logger.info('Replace the package names & class names in lib ...');
  Directory('lib').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.contains('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    _replaceInFile(element.path, originalProjectName, packageName);
    _replaceInFile(element.path, originalClassNamePrefix, classNamePrefix);
    _renameDartFile(element.path, packageName);
  });

  Logger.info('Replace the package names & class names in test ...');
  final testDir = Directory('test');
  if (testDir.existsSync()) {
    testDir.listSync(recursive: true).where((element) {
      if (element.path.endsWith('.png')) return false;
      if (element.path.contains('.DS_Store')) return false;
      if (Directory(element.path).existsSync()) return false;
      if (element.path.contains('.DS_Store')) return false;
      return true;
    }).forEach((element) {
      _replaceInFile(element.path, originalProjectName, packageName);
      _replaceInFile(element.path, originalClassNamePrefix, classNamePrefix);
      _renameDartFile(element.path, packageName);
    });

    Logger.info('Rename snapshot files ...');
    testDir.listSync(recursive: true).where((element) {
      return element.path.endsWith('.png');
    }).forEach((element) {
      _renameDartFile(element.path, packageName);
    });
  }
}

void _renameTools(String dartPackageName, String description, String classNamePrefix, String appName, String iosBundleIdentifier, String androidPackageName, {bool force = false}) {
  Logger.info('Replace the package names in the tools folder ...');
  Directory('tool').listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (element.path.contains('.DS_Store')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    if (force == false && element.path == './tool/dart_tool/rename_project.dart') return;
    _replaceInFile(element.path, originalDescription, description);
    _replaceInFile(element.path, originalAppName, appName);
    _replaceInFile(element.path, originalProjectName, dartPackageName);
    _replaceInFile(element.path, originalClassNamePrefix, classNamePrefix);
    _replaceInFile(element.path, originalIOSBundleIdentifier, iosBundleIdentifier);
    _replaceInFile(element.path, originalAndroidPackageName, androidPackageName);
    _replaceInFile(element.path, originalAndroidFolderPath, androidPackageName.replaceAll('.', '/'));
  });
}

void _renameReadMe(bool replaceAll, String dartPackageName, String description, String classNamePrefix, String appName, String iosBundleIdentifier, String androidPackageName) {
  Logger.info('Renaming the README.md file ...');
  const readmePath = 'README.md';
  if (replaceAll) {
    File(readmePath).writeAsString('#### $appName');
    return;
  }

  _replaceInFile(readmePath, originalDescription, description);
  _replaceInFile(readmePath, originalAppName, appName);
  _replaceInFile(readmePath, originalProjectName, dartPackageName);
  _replaceInFile(readmePath, originalClassNamePrefix, classNamePrefix);
  _replaceInFile(readmePath, originalIOSBundleIdentifier, iosBundleIdentifier);
  _replaceInFile(readmePath, originalAndroidPackageName, androidPackageName);
}

void _packagesGet() {
  _executeCommand('flutter', ['packages', 'get']);
}

void _performFinalCheck() {
  Logger.debug('Starting the final path reference check...');
  var valid = true;
  Directory('.').listSync(recursive: true).where((element) {
    if (element.path.startsWith('./.git/')) return false;
    if (element.path.startsWith('./build/')) return false;
    if (element.path.startsWith('./.dart_tool/')) return false;
    if (element.path.startsWith('./.fvm/')) return false;
    if (element.path.startsWith('./.idea/')) return false;
    if (element.path.startsWith('./.DS_STORE')) return false;
    return true;
  }).forEach((element) {
    if (element.path.contains(originalProjectName) ||
        element.path.contains(originalClassNamePrefix) ||
        element.path.contains(originalIOSBundleIdentifier) ||
        element.path.contains(originalAndroidPackageName) ||
        element.path.contains(originalAndroidFolderPath) ||
        element.path.contains(originalAppName)) {
      Logger.debug('${element.path} path still contains some template references');
      valid = false;
    }
  });
  Logger.debug('Final path reference check finished');
  Logger.debug('');
  Logger.debug('Starting the final content reference check...');
  Directory('.').listSync(recursive: true).where((element) {
    if (element.path.startsWith('./.git/')) return false;
    if (element.path.startsWith('./build/')) return false;
    if (element.path.startsWith('./.idea/')) return false;
    if (element.path.startsWith('./.dart_tool/')) return false;
    if (element.path.startsWith('./.fvm/')) return false;
    if (element.path.startsWith('./.DS_STORE')) return false;
    if (element.path.endsWith('.png')) return false;
    if (element.path.endsWith('.ttf')) return false;
    if (element.path.endsWith('lcov.info')) return false;
    if (element.path.endsWith('tool/dart_tool/rename_project.dart')) return false;
    if (element.path.endsWith('./ios/Flutter/App.framework/flutter_assets/NOTICES')) return false;
    if (Directory(element.path).existsSync()) return false;
    if (element.path.contains('.DS_Store')) return false;
    return true;
  }).forEach((element) {
    if (element.path == './tool/dart_tool/rename_project.dart' || element.path == './tool/travis/rename_project.dart') {
      return;
    }
    try {
      final content = File(element.path).readAsStringSync();
      if (content.contains(originalProjectName) ||
          content.contains(originalClassNamePrefix) ||
          content.contains(originalIOSBundleIdentifier) ||
          content.contains(originalAndroidPackageName) ||
          content.contains(originalAndroidFolderPath) ||
          content.contains(originalAppName)) {
        Logger.debug('${element.path} content still contains some template references');
        valid = false;
      }
    } on FileSystemException catch (_) {}
  });
  Logger.debug('Final content reference check finished');
  Logger.debug('');
  if (!valid) {
    Logger.debug('rename_project.dart could not finish successfully');
    exit(-1);
  }
}

/// ==============
/// UTIL FUNCTIONS
/// ==============
void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) {
    Logger.error('❌❌❌ $path does not exist');
    return;
  }
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

void _renameDartFile(String path, String newPackageName) {
  final newPath = path.replaceAll(originalProjectName, newPackageName);
  File(path).renameSync(newPath);
}

void _renameKotlinFile(String path, String newPackageName) {
  final newPathFolder = newPackageName.replaceAll('.', '/');
  final newPath = path.replaceAll('android/app/src/main/kotlin/$originalAndroidFolderPath/', 'android/app/src/main/kotlin/$newPathFolder/');
  final newFolder = Directory('android/app/src/main/kotlin/$newPathFolder');
  if (!newFolder.existsSync()) {
    newFolder.createSync(recursive: true);
  }
  File(path)
    ..copySync(newPath)
    ..deleteSync();
}

void _renameFastlaneAppCenterIds(AppCenterApp appCenterApp, String classNamePrefix, {String? value}) {
  switch (appCenterApp) {
    case AppCenterApp.androidAlpha:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android-Alpha' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "$originalClassNamePrefix-Android-Alpha"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.androidBeta:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android-Beta' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "$originalClassNamePrefix-Android-Beta"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.androidProd:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "$originalClassNamePrefix-Android"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.iosAlpha:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS-Alpha' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "$originalClassNamePrefix-iOS-Alpha"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.iosBeta:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS-Beta' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "$originalClassNamePrefix-iOS-Beta"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.iosProd:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "$originalClassNamePrefix-iOS"', 'appcenter_app_name = "$newValue"');
      break;
  }
}

void _executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    Logger.info(fullCommand);
    final result = Process.runSync(cmd, params);
    final dynamic output = result.stdout;
    if (output.toString().isNotEmpty) {
      Logger.debug('$output');
    }
  } catch (e) {
    Logger.error('\nFailed to execute command: $fullCommand\n$e');
    exit(-1);
  }
}

enum AppCenterApp {
  androidAlpha,
  androidBeta,
  androidProd,
  iosAlpha,
  iosBeta,
  iosProd,
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
