import 'dart:io';

const originalProjectName = 'flutter_template';
const originalClassNamePrefix = 'FlutterTemplate';

void main() {
  Logger.info('Enter Dart Package Name:');
  final dartPackageName = stdin.readLineSync();
  Logger.info('Enter Dart Class Name Prefix:');
  final classNamePrefix = stdin.readLineSync();

  Logger.info('\nEnter Android Package Name / iOS Bundle Identifier:');
  final androidPackageName = stdin.readLineSync();

  bool specificAppCenterIds;
  do {
    Logger.info('\nDo you want to specify the AppCenter ids?\nOr use the default config: $classNamePrefix-iOS/Android-Alpha/Beta (yes/no)');
    final result = stdin.readLineSync();
    final validResult = result == 'y' || result == 'n' || result == 'yes' || result == 'no';
    if (validResult) {
      specificAppCenterIds = result == 'y' || result == 'yes';
    }
  } while (specificAppCenterIds == null);

  _renameAppCenterIds(classNamePrefix, specificAppCenterIds);
  _renamePackage(dartPackageName, classNamePrefix);
  _packagesGet();
}

void _renamePackage(String packageName, String classNamePrefix) {
  Logger.info('Using `$packageName` as your new dart package name');
  Logger.info('Replace text in Pubspec.yaml ...');
  _replaceInFile('pubspec.yaml', 'name: $originalProjectName', 'name: $packageName');

  Logger.info('Replace text in files ...');
  Directory('lib').listSync(recursive: true).where((element) => !Directory(element.path).existsSync()).forEach((element) {
    _replaceInFile(element.path, "import 'package:$originalProjectName/", "import 'package:$packageName/");
    _replaceImportInFile(element.path, originalProjectName, packageName);
    _replaceImportInFile(element.path, originalClassNamePrefix, classNamePrefix);
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
    _replaceImportInFile(element.path, originalClassNamePrefix, classNamePrefix);
    _renameFile(element.path, packageName);
  });

  Logger.info('Replace text in specific files ...');
}

void _renameAppCenterIds(String classNamePrefix, bool specificAppCenterIds) {
  if (specificAppCenterIds) {
    Logger.info('Enter iOS AppCenter Alpha id: (Default is $classNamePrefix-iOS-Alpha)');
    final appCenterIosAlphaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_ALPHA, classNamePrefix, value: appCenterIosAlphaId);
    Logger.info('Enter iOS AppCenter Beta id: (Default is $classNamePrefix-iOS-Beta)');
    final appCenterIosBetaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_BETA, classNamePrefix, value: appCenterIosBetaId);
    Logger.info('Enter iOS AppCenter Prod id: (Default is $classNamePrefix-iOS)');
    final appCenterIosProdId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_PROD, classNamePrefix, value: appCenterIosProdId);

    Logger.info('Enter Android AppCenter Alpha id: (Default is $classNamePrefix-Android-Alpha)');
    final appCenterAndroidAlphaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_ALPHA, classNamePrefix, value: appCenterAndroidAlphaId);
    Logger.info('Enter Android AppCenter Beta id: (Default is $classNamePrefix-Android-Beta)');
    final appCenterAndroidBetaId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_BETA, classNamePrefix, value: appCenterAndroidBetaId);
    Logger.info('Enter Android AppCenter Prod id: (Default is $classNamePrefix-Android)');
    final appCenterAndroidProdId = stdin.readLineSync();
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_PROD, classNamePrefix, value: appCenterAndroidProdId);
  } else {
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_ALPHA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_BETA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.IOS_PROD, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_ALPHA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_BETA, classNamePrefix);
    _renameFastlaneAppCenterIds(AppCenterApp.ANDROID_PROD, classNamePrefix);
  }
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
  final newContent = originalLines.map((element) => element.replaceAll(originalString, newString));
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

void _renameFastlaneAppCenterIds(AppCenterApp appCenterApp, String classNamePrefix, {String value}) {
  switch (appCenterApp) {
    case AppCenterApp.ANDROID_ALPHA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android-Alpha' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-Android-Alpha"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.ANDROID_BETA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android-Beta' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-Android-Beta"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.ANDROID_PROD:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-Android' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-Android"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.IOS_ALPHA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS-Alpha' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-iOS-Alpha"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.IOS_BETA:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS-Beta' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-iOS-Beta"', 'appcenter_app_name = "$newValue"');
      break;
    case AppCenterApp.IOS_PROD:
      final newValue = value == null || value.isEmpty ? '$classNamePrefix-iOS' : value;
      _replaceInFile('fastlane/Fastfile', 'appcenter_app_name = "FlutterTemplate-iOS"', 'appcenter_app_name = "$newValue"');
      break;
  }
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

enum AppCenterApp {
  ANDROID_ALPHA,
  ANDROID_BETA,
  ANDROID_PROD,
  IOS_ALPHA,
  IOS_BETA,
  IOS_PROD,
}

class Logger {
  Logger._();

  static void debug(value) => print(value); // ignore: avoid_print

  static void info(value) => print(value); // ignore: avoid_print
  static void error(value) => print(value); // ignore: avoid_print
}
