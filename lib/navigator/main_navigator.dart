import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/middle_ware/authentication_guard.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/theme_mode/theme_mode_selector.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/snackbar/error_util.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
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
    BasePage<void>(
      name: RouteNames.root,
      page: () => const FlavorBanner(child: SplashScreen()),
    ),
    BasePage<void>(
      name: SplashScreen.routeName,
      page: () => const FlavorBanner(child: SplashScreen()),
    ),
    BasePage<void>(
      name: LoginScreen.routeName,
      page: () => const FlavorBanner(child: LoginScreen()),
    ),
    BasePage<void>(
      name: HomeScreen.routeName,
      page: () => const FlavorBanner(child: HomeScreen()),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: TodoAddScreen.routeName,
      page: () => const FlavorBanner(child: TodoAddScreen()),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: DebugPlatformSelectorScreen.routeName,
      page: () => const FlavorBanner(child: DebugPlatformSelectorScreen()),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: ThemeModeSelectorScreen.routeName,
      page: () => const FlavorBanner(child: ThemeModeSelectorScreen()),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: DebugScreen.routeName,
      page: () => const FlavorBanner(child: DebugScreen()),
      middlewares: [AuthenticationGuard()],
    ),
    BasePage<void>(
      name: LicenseScreen.routeName,
      page: () => const FlavorBanner(child: LicenseScreen()),
      middlewares: [AuthenticationGuard()],
    ),
  ];

  Future<void> goToSplash() async => Get.offNamed<void>(SplashScreen.routeName);

  Future<void> goToLogin() async => Get.offNamed<void>(LoginScreen.routeName);

  Future<void> goToHome() async => Get.offNamed<void>(HomeScreen.routeName);

  Future<void> goToAddTodo() async => Get.toNamed<void>(TodoAddScreen.routeName);

  Future<void> goToDebugPlatformSelector() async => Get.toNamed<void>(DebugPlatformSelectorScreen.routeName);

  Future<void> goToThemeModeSelector() async => Get.toNamed<void>(ThemeModeSelectorScreen.routeName);

  Future<void> goToDebug() async => Get.toNamed<void>(DebugScreen.routeName);

  Future<void> goToLicense() async => Get.toNamed<void>(LicenseScreen.routeName);

  Future<void> closeDialog() async => Get.back<void>();

  Future<void> goToDatabase(GeneratedDatabase db) async => Get.to<void>(DriftDbViewer(db));

  Future<void> goBack<T>({T? result}) async => Get.back<T>(result: result);

  Future<void> showCustomDialog<T>({Widget? widget}) async => Get.dialog<T>(widget ?? const SizedBox.shrink());

  Future<void> showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) async => _errorUtil.showErrorWithLocaleKey(errorKey, args: args);

  Future<void> showError(dynamic error) async => _errorUtil.showError(error);
}
