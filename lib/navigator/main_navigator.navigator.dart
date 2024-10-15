// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: prefer_const_constructors

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert';

import 'package:flutter/material.dart' as _i1;
import 'package:flutter/material.dart';

import '../screen/debug/debug_platform_selector_screen.dart';
import '../screen/debug/debug_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/license/license_screen.dart';
import '../screen/log_detail/log_detail_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/logs/logs_screen.dart';
import '../screen/permission/analytics_permission_screen.dart';
import '../screen/splash/splash_screen.dart';
import '../screen/theme_mode/theme_mode_selector.dart';
import '../screen/todo/todo_add/todo_add_screen.dart';

mixin BaseNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments is Map
        ? (settings.arguments as Map).cast<String, dynamic>()
        : <String, dynamic>{};
    final settingsUri = Uri.parse(settings.name ?? '');
    settingsUri.queryParameters.forEach((key, value) {
      arguments[key] ??= value;
    });
    switch (settingsUri.path) {
      case RouteNames.homeScreen:
        return MaterialPageRoute<void>(
          builder: (_) => HomeScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) => SplashScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.licenseScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LicenseScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.todoAddScreen:
        return MaterialPageRoute<void>(
          builder: (_) => TodoAddScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.analyticsPermissionScreen:
        return MaterialPageRoute<void>(
          builder: (_) => AnalyticsPermissionScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LoginScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.themeModeSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ThemeModeSelectorScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugPlatformSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugPlatformSelectorScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.logsScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LogsScreen(
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.logDetailScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LogDetailScreen(
            date: arguments['date'] as String,
            key: arguments['key'] as Key?,
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
  Future<void> goToLogsScreen({_i1.Key? key}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.logsScreen,
        arguments: {'key': key},
      );
  Future<void> goToLogDetailScreen({
    required String date,
    _i1.Key? key,
  }) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        Uri(
          path: RouteNames.logDetailScreen,
          queryParameters: {'date': date},
        ).toString(),
        arguments: {'date': date, 'key': key},
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
  /// /home
  static const homeScreen = '/home';

  /// /splash
  static const splashScreen = '/splash';

  /// /license
  static const licenseScreen = '/license';

  /// /todo-add
  static const todoAddScreen = '/todo-add';

  /// /analytics-permission
  static const analyticsPermissionScreen = '/analytics-permission';

  /// /login
  static const loginScreen = '/login';

  /// /theme-mode-selector
  static const themeModeSelectorScreen = '/theme-mode-selector';

  /// /debug-platform-selector
  static const debugPlatformSelectorScreen = '/debug-platform-selector';

  /// /debug
  static const debugScreen = '/debug';

  /// /logs
  static const logsScreen = '/logs';

  /// /log-detail
  static const logDetailScreen = '/log-detail';
}
