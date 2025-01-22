import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/model/snackbar/snackbar_data.dart';
import 'package:flutter_template/navigator/main_navigator.navigator.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/snackbar/error_util.dart';
import 'package:flutter_template/util/snackbar/snackbar_util.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@flutterNavigator
class MainNavigator with BaseNavigator {
  late final _navigator = navigatorKey.currentState!;
  final ErrorUtil _errorUtil;

  MainNavigator(this._errorUtil);

  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : RouteNames.splashScreen;

  BuildContext get context => navigatorKey.currentContext!;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  Future<void> goToDatabase(GeneratedDatabase db) async => _navigator.push<void>(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));

  void showErrorWithLocaleKey({required String messageKey, String? titleKey, List<dynamic>? args}) => _errorUtil.showErrorWithLocaleKey(
        context: navigatorKey.currentContext!,
        messageKey: messageKey,
        titleKey: titleKey,
        args: args,
      );

  void showError(dynamic error) => _errorUtil.showError(error: error, context: navigatorKey.currentContext!);

  Future<void> showCustomSnackBar({
    required String message,
    String? title,
    SnackBarStyle style = SnackBarStyle.neutral,
  }) async =>
      SnackBarUtil.showSnackbar(
        context: navigatorKey.currentContext!,
        title: title,
        message: message,
        style: style,
      );
}
