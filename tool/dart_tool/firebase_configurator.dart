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

  // Overwrite files
  File('lib/repository/analytics/firebase_analytics_repository.dart').deleteSync();
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

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
