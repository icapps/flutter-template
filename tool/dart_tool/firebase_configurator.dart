import 'dart:io';

void main() {
  bool? enableFirebase;
  do {
    Logger.info('\nDo you want to enable firebase? (yes/no)');
    final result = stdin.readLineSync();
    final validResult = result == 'y' || result == 'n' || result == 'yes' || result == 'no';
    if (validResult) {
      enableFirebase = result == 'y' || result == 'yes';
    }
  } while (enableFirebase == null);
  if (enableFirebase) {
    Logger.debug('You can not enable firebase again with this plugin. only remove firebase');
    exit(0);
  }
  // Remove Files
  File('lib/repository/analytics/firebase_analytics_repository.dart').deleteSync();
  Directory('ios/Configuration/GoogleService').deleteSync(recursive: true);

  // Remove lines in files
  _removeLineInFileStartWith('android/build.gradle', "        classpath 'com.google.gms:google-services:4.3.8'");
  _removeLineInFileStartWith('android/build.gradle', "        classpath 'com.google.firebase:firebase-crashlytics-gradle:2.7.1'");
  _removeLineInFileStartWith('android/app/build.gradle', "apply plugin: 'com.google.gms.google-services'");
  _removeLineInFileStartWith('android/app/build.gradle', "apply plugin: 'com.google.firebase.crashlytics'");
  _removeLineInFileStartWith('pubspec.yaml', '  firebase_analytics');
  _removeLineInFileStartWith('pubspec.yaml', '  firebase_core');
  _removeLineInFileStartWith('pubspec.yaml', '  firebase_crashlytics');
  _removeLineInFileStartWith('lib/main_common.dart', "import 'package:firebase_core/firebase_core.dart';");
  _removeLineInFileStartWith('lib/di/injectable.dart', "import 'package:firebase_analytics/firebase_analytics.dart';");
  _removeLineInFileStartWith('lib/di/injectable.dart', "import 'package:firebase_analytics/firebase_analytics.dart';");
  _removeLineInFileStartWith('lib/main_common.dart', "import 'package:firebase_crashlytics/firebase_crashlytics.dart';");
  _removeLineInFileStartWith('lib/main_common.dart', "    await _setupCrashLogging");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "		3629EB6826E758C500F774E2 /* GoogleService-Info-dev.plist in Resources */ = {isa = PBXBuildFile; fileRef = 3629EB6726E758C500F774E2 /* GoogleService-Info-dev.plist */; };");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "		3629EB6A26E758D200F774E2 /* GoogleService-Info.plist in Resources */ = {isa = PBXBuildFile; fileRef = 3629EB6926E758D200F774E2 /* GoogleService-Info.plist */; };");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', '		3629EB6726E758C500F774E2 /* GoogleService-Info-dev.plist */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.xml; path = "GoogleService-Info-dev.plist"; sourceTree = "<group>"; };');
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', '		3629EB6926E758D200F774E2 /* GoogleService-Info.plist */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.plist.xml; path = "GoogleService-Info.plist"; sourceTree = "<group>"; };');
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "				3629EB6926E758D200F774E2 /* GoogleService-Info.plist */,");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "				3629EB6626E758A300F774E2 /* GoogleService */,");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "				3629EB6926E758D200F774E2 /* GoogleService-Info.plist */,");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "				3629EB6826E758C500F774E2 /* GoogleService-Info-dev.plist in Resources */,");
  _removeLineInFileStartWith('ios/Runner.xcodeproj/project.pbxproj', "				3629EB6A26E758D200F774E2 /* GoogleService-Info.plist in Resources */,");

  // Replace content in files
  replaceInFile(
      'lib/main_common.dart',
      '''
Future<void> _setupCrashLogging({required bool enabled}) async {
  if (enabled) {
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enabled);
    unawaited(FirebaseCrashlytics.instance.sendUnsentReports());
  }

  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    if (enabled) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    originalOnError?.call(errorDetails);
  };
}

''',
      '');
  replaceInFile(
      'lib/main_common.dart',
      '''    if (enableCrashLogging) {
      FirebaseCrashlytics.instance.recordError(object, trace);
    }
''',
      '');
  replaceInFile(
      'lib/di/injectable.dart',
      '''  @lazySingleton
  FirebaseAnalytics provideFirebaseAnalytics() => FirebaseAnalytics.instance;
''',
      '');
  replaceInFile(
      'lib/navigator/main_navigator.dart', '    GetIt.I.get<FireBaseAnalyticsRepository>().routeObserver,', '    GetIt.I.get<CustomAnalyticsRepository>().routeObserver,');
  replaceInFile('lib/navigator/main_navigator.dart', "import 'package:flutter_template/repository/analytics/firebase_analytics_repository.dart';",
      "import 'package:flutter_template/repository/analytics/custom_analytics_repository.dart';");
  replaceInFile(
      'ios/Runner.xcodeproj/project.pbxproj',
      r'			shellScript = "#! /bin/sh\n\n\necho \"💾 Prepare firebase plist\"\nconfig=${CONFIGURATION}\nconfig=${config//Release-/}\nconfig=${config//Debug-/}\ncp \"${PROJECT_DIR}/Configuration/GoogleService/GoogleService-Info-${config}.plist\" \"${PROJECT_DIR}/Runner/GoogleService-Info.plist\"\n\necho \"Run {PODS_ROOT}/FirebaseCrashlytics/run\"\n${PODS_ROOT}/FirebaseCrashlytics/run\n";',
      r'			shellScript = "#! /bin/sh\n\nconfig=${CONFIGURATION}\nconfig=${config//Release-/}\nconfig=${config//Debug-/}\necho \"Configuration mapping should be done here\"\n";');
  replaceInFile(
      'ios/Runner.xcodeproj/project.pbxproj',
      '''		3629EB6626E758A300F774E2 /* GoogleService */ = {
			isa = PBXGroup;
			children = (
				3629EB6726E758C500F774E2 /* GoogleService-Info-dev.plist */,
			);
			path = GoogleService;
			sourceTree = "<group>";
		};
''',
      r'');

  // Overwrite files
  File('lib/repository/analytics/custom_analytics_repository.dart').writeAsStringSync('''import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/repository/analytics/analytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class CustomAnalyticsRepository implements Analytics {
  @factoryMethod
  factory CustomAnalyticsRepository() = _CustomAnalyticsRepository;

  RouteObserver get routeObserver;
}

class _CustomAnalyticsRepository with WidgetsBindingObserver implements CustomAnalyticsRepository {
  
  @override
  RouteObserver<Route> get routeObserver => RouteObserver();

  @override
  void init() {
    logAppOpen();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void trackEvent(String name, {Map<String, Object?>? arguments}) {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      logAppOpen();
    } else if (state == AppLifecycleState.paused) {
      trackEvent(Analytics.eventAppBackground);
    }
  }

  @override
  void dispose() {}

  @override
  void onLoggedIn() {}

  void logAppOpen() {}
  
  @override
  void onSignedUp() {}
}
''');

  // In Tests
  if (!Directory('test').existsSync()) return;
  // Remove lines in files
  _removeLineInFileStartWith('test/di/injectable_test.dart', "import 'package:firebase_analytics/firebase_analytics.dart';");
  _removeLineInFileStartWith('test/di/test_injectable.dart', "import 'package:firebase_analytics/firebase_analytics.dart';");
  _removeLineInFileStartWith('test/di/injectable_test.dart', "  FirebaseAnalytics,");
  // Replace content in files

  // Overwrite files
  replaceInFile(
      'test/di/test_injectable.dart',
      '''  @Environment(Environments.test)
  @singleton
  FirebaseAnalytics get getFirebaseAnalytics => MockFirebaseAnalytics();''',
      "");

  // Build project
  executeCommand('fvm', ['flutter', 'packages', 'get']);
  executeCommand('fvm', ['flutter', 'clean']);
  executeCommand('fvm', ['flutter', 'packages', 'get']);
  executeCommand('fvm', ['flutter', 'packages', 'pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  executeCommand('cd', ['ios', '&&', 'pod', 'install', '&&', 'cd', '..']);
}

void replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

void _removeLineInFileStartWith(String path, String startWithString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsLinesSync();
  final newContent = <String>[];
  for (final line in original) {
    if (line.startsWith(startWithString)) continue;
    newContent.add(line);
  }
  file.writeAsStringSync(newContent.join('\n'));
}

void executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    Logger.debug('\nExecuting command:\n$fullCommand');
    final result = Process.runSync(cmd, params);
    if (result.stderr.toString().isNotEmpty) {
      throw Exception(result.stderr.toString());
    }
    Logger.debug(result.stdout.toString());
  } catch (e) {
    Logger.debug('\nFailed to execute command: $fullCommand\n$e');
    rethrow;
  }
}

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
