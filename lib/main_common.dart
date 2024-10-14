import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:flutter_template/util/web/app_configurator.dart' if (dart.library.html) 'package:flutter_template/util/web/app_configurator_web.dart';

Future<void> _setupCrashLogging() async {
  await Firebase.initializeApp();
  if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) unawaited(FirebaseCrashlytics.instance.sendUnsentReports());
  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
    originalOnError?.call(errorDetails);
  };
}

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) async {
  PlatformDispatcher.instance.onError = (error, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      FlutterTemplateLogger.logError('Uncaught platform error', error: error, stackTrace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(trace);
    }

    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      FirebaseCrashlytics.instance.recordError(error, trace);
    }
    return true; // Handled
  };

  WidgetsFlutterBinding.ensureInitialized();
  configureWebApp();
  await _setupCrashLogging();
  await initArchitecture();

  return await appCode();
}
