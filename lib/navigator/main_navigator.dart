import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:get/route_manager.dart';

class MainNavigatorWidget {
  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: SplashScreen()), settings: settings);
      case LoginScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: LoginScreen()), settings: settings);
      case HomeScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: HomeScreen()), settings: settings);
      case TodoAddScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: TodoAddScreen()), settings: settings);
      case DebugPlatformSelectorScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: DebugPlatformSelectorScreen()), settings: settings);
      case ThemeModeSelectorScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: ThemeModeSelectorScreen()), settings: settings);
      case DebugScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: DebugScreen()), settings: settings);
      case LicenseScreen.routeName:
        return GetPageRoute<void>(page: () => const FlavorBanner(child: LicenseScreen()), settings: settings);
      case DetailScreen.routeName:
        final argument = settings.arguments as String;
        return GetPageRoute<void>(page: () => FlavorBanner(child: DetailScreen(id: argument)), settings: settings);
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return GetPageRoute<void>(page: () => FlavorBanner(child: Container(color: Colors.grey)), settings: settings);
      default:
        return null;
    }
  }

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

  static void goToDetail({required String id}) => Get.toNamed<void>(DetailScreen.routeName, arguments: id);
}
