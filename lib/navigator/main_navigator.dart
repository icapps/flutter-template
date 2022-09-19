import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/middle_ware/authentication_guard.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/detail/detail_screen.dart';
import 'package:flutter_template/screen/theme_mode/theme_mode_selector.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/snackbar/error_util.dart';
import 'package:flutter_template/widget/general/navigator_page/base_page.dart';
import 'package:get/route_manager.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MainNavigator {
  final ErrorUtil _errorUtil;

  MainNavigator(this._errorUtil);

  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  static final pages = [
    BasePage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    BasePage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
    ),
    BasePage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage(
      name: TodoAddScreen.routeName,
      page: () => const TodoAddScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage(
      name: DebugPlatformSelectorScreen.routeName,
      page: () => const DebugPlatformSelectorScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage(
      name: ThemeModeSelectorScreen.routeName,
      page: () => const ThemeModeSelectorScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage(
      name: DebugScreen.routeName,
      page: () => const DebugScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: LicenseScreen.routeName,
      page: () => const LicenseScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: DetailScreen.routeName,
      page: () => const DetailScreen(),
      middlewares: [AuthenticationGuard()],
      fullscreenDialog: true,
    ),
  ];

  void goToSplash() => Get.offNamed<void>(SplashScreen.routeName);

  void goToLogin() => Get.offNamed<void>(LoginScreen.routeName);

  void goToHome() => Get.offNamed<void>(HomeScreen.routeName);

  void goToAddTodo() => Get.toNamed<void>(TodoAddScreen.routeName);

  void goToDebugPlatformSelector() => Get.toNamed<void>(DebugPlatformSelectorScreen.routeName);

  void goToThemeModeSelector() => Get.toNamed<void>(ThemeModeSelectorScreen.routeName);

  void goToDebug() => Get.toNamed<void>(DebugScreen.routeName);

  void goToLicense() => Get.toNamed<void>(LicenseScreen.routeName);

  void closeDialog() => Get.back<void>();

  void goToDatabase(GeneratedDatabase db) => Get.to<void>(DriftDbViewer(db));

  void goBack<T>({T? result}) => Get.back<T>(result: result);

  void showCustomDialog<T>({required Widget widget}) => Get.dialog<T>(widget);

  void goToDetail({required String id}) => Get.toNamed<void>(DetailScreen.routeNameBase + id);

  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) => _errorUtil.showErrorWithLocaleKey(errorKey, args: args);

  void showError(dynamic error) => _errorUtil.showError(error);
}
