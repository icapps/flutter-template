import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/snackbar/snackbar_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/snackbar/error_util.dart';
import 'package:flutter_template/util/snackbar/snackbar_util.dart';
import 'package:get/route_manager.dart';
import 'package:get_x_navigation_generator_interface/get_x_navigation_generator_interface.dart';
import 'package:injectable/injectable.dart';

import 'main_navigator.get_x_navigator.dart';

@getXNavigator
@lazySingleton
class MainNavigator extends BaseNavigator {
  final ErrorUtil _errorUtil;

  MainNavigator(this._errorUtil);

  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : RouteNames.splashScreen;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  static final List<GetPage> pages = BaseNavigator.pages;

  void closeDialog() async => goBack<void>();

  Future<void> goToDatabase(GeneratedDatabase db) async => Get.to<void>(DriftDbViewer(db));

  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) => _errorUtil.showErrorWithLocaleKey(errorKey, args: args);

  void showError(dynamic error) => _errorUtil.showError(error);

  Future<void> showCustomSnackBar({
    required String message,
    String? title,
    SnackBarStyle style = SnackBarStyle.neutral,
  }) async =>
      SnackBarUtil.showSnackbar(
        title: title,
        message: message,
        style: style,
      );
}
