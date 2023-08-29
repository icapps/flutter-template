// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i1;
import 'package:flutter/material.dart';

import '../screen/debug/debug_platform_selector_screen.dart';
import '../screen/debug/debug_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/license/license_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/permission/analytics_permission_screen.dart';
import '../screen/splash/splash_screen.dart';
import '../screen/theme_mode/theme_mode_selector.dart';
import '../screen/todo/todo_add/todo_add_screen.dart';

mixin BaseNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute<void>(
          builder: (_) => HomeScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) => SplashScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.licenseScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LicenseScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.todoAddScreen:
        return MaterialPageRoute<void>(
          builder: (_) => TodoAddScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.analyticsPermissionScreen:
        return MaterialPageRoute<void>(
          builder: (_) => AnalyticsPermissionScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LoginScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.themeModeSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ThemeModeSelectorScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugPlatformSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugPlatformSelectorScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
    }
    return null;
  }

  void goToHomeScreen({_i1.Key? key}) =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.homeScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goToSplashScreen({_i1.Key? key}) =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.splashScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToLicenseScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.licenseScreen,
        arguments: {'key': key},
      );
  Future<void> goToTodoAddScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.todoAddScreen,
        arguments: {'key': key},
      );
  Future<void> goToAnalyticsPermissionScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.analyticsPermissionScreen,
        arguments: {'key': key},
      );
  void goToLoginScreen({_i1.Key? key}) =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.loginScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToThemeModeSelectorScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.themeModeSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugPlatformSelectorScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugPlatformSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugScreen,
        arguments: {'key': key},
      );
  void goBack() => navigatorKey.currentState?.pop();
  void goBackWithResult<T>({T? result}) =>
      navigatorKey.currentState?.pop(result);
  void popUntil(bool Function(Route<dynamic>) predicate) =>
      navigatorKey.currentState?.popUntil(predicate);
  void goBackTo(String routeName) =>
      popUntil((route) => route.settings.name == routeName);
  Future<T?> showCustomDialog<T>({Widget? widget}) async => showDialog<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
  Future<T?> showBottomSheet<T>({Widget? widget}) async =>
      showModalBottomSheet<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
}

class RouteNames {
  static const homeScreen = '/home';

  static const splashScreen = '/splash';

  static const licenseScreen = '/license';

  static const todoAddScreen = '/todo-add';

  static const analyticsPermissionScreen = '/analytics-permission';

  static const loginScreen = '/login';

  static const themeModeSelectorScreen = '/theme-mode-selector';

  static const debugPlatformSelectorScreen = '/debug-platform-selector';

  static const debugScreen = '/debug';
}
