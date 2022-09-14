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
import 'package:get/route_manager.dart';

class MainNavigator {
  MainNavigator._();

  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  static final pages = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    GetPage(
      name: TodoAddScreen.routeName,
      page: () => const TodoAddScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    GetPage(
      name: DebugPlatformSelectorScreen.routeName,
      page: () => const DebugPlatformSelectorScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    GetPage(
      name: ThemeModeSelectorScreen.routeName,
      page: () => const ThemeModeSelectorScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    GetPage(
      name: DebugScreen.routeName,
      page: () => const DebugScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    GetPage<void>(
      name: LicenseScreen.routeName,
      page: () => const LicenseScreen(),
      middlewares: [AuthenticationGuard()],
    ),
    GetPage<void>(
      name: DetailScreen.routeName,
      page: () => const DetailScreen(),
      middlewares: [AuthenticationGuard()],
    ),
  ];

  static void goToSplash() => Get.offNamed<void>(SplashScreen.routeName);

  static void goToLogin() => Get.offNamed<void>(LoginScreen.routeName);

  static void goToHome() => Get.offNamed<void>(HomeScreen.routeName);

  static void goToAddTodo() => Get.toNamed<void>(TodoAddScreen.routeName);

  static void goToDebugPlatformSelector() => Get.toNamed<void>(DebugPlatformSelectorScreen.routeName);

  static void goToThemeModeSelector() => Get.toNamed<void>(ThemeModeSelectorScreen.routeName);

  static void goToDebug() => Get.toNamed<void>(DebugScreen.routeName);

  static void goToLicense() => Get.toNamed<void>(LicenseScreen.routeName);

  static void closeDialog() => Get.back<void>();

  static void goToDatabase(GeneratedDatabase db) => Get.to<void>(DriftDbViewer(db));

  static void goBack<T>({T? result}) => Get.back<T>(result: result);

  static void showCustomDialog<T>({required Widget widget}) => Get.dialog<T>(widget);

  static void goToDetail({required String id}) => Get.toNamed<void>(DetailScreen.routeNameBase + id);
}
