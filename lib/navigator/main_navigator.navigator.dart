// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/foundation.dart';
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
    final queryParameters = Map.from(settingsUri.queryParameters);
    switch (settingsUri.path) {
      case RouteNames.homeScreen:
        return MaterialPageRoute<void>(
          builder: (_) => HomeScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) => SplashScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.licenseScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LicenseScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.logDetailScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LogDetailScreen(
            date: queryParameters['date'] ?? arguments['date'] as String,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.todoAddScreen:
        return MaterialPageRoute<void>(
          builder: (_) => TodoAddScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.logsScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LogsScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.analyticsPermissionScreen:
        return MaterialPageRoute<void>(
          builder: (_) => AnalyticsPermissionScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LoginScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.themeModeSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ThemeModeSelectorScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugPlatformSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugPlatformSelectorScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
    }
    return null;
  }

  void goToHomeScreen() =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.homeScreen,
        (_) => false,
        arguments: {},
      );
  void goToSplashScreen() =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.splashScreen,
        (_) => false,
        arguments: {},
      );
  Future<void> goToLicenseScreen() async => navigatorKey.currentState
      ?.pushNamed<dynamic>(RouteNames.licenseScreen, arguments: {});
  Future<void> goToLogDetailScreen({required String date}) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        Uri(
          path: RouteNames.logDetailScreen,
          queryParameters: kIsWeb ? {'date': date} : null,
        ).toString(),
        arguments: {'date': date},
      );
  Future<void> goToTodoAddScreen() async => navigatorKey.currentState
      ?.pushNamed<dynamic>(RouteNames.todoAddScreen, arguments: {});
  Future<void> goToLogsScreen() async => navigatorKey.currentState
      ?.pushNamed<dynamic>(RouteNames.logsScreen, arguments: {});
  Future<void> goToAnalyticsPermissionScreen() async => navigatorKey
      .currentState
      ?.pushNamed<dynamic>(RouteNames.analyticsPermissionScreen, arguments: {});
  void goToLoginScreen() =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.loginScreen,
        (_) => false,
        arguments: {},
      );
  Future<void> goToThemeModeSelectorScreen() async => navigatorKey.currentState
      ?.pushNamed<dynamic>(RouteNames.themeModeSelectorScreen, arguments: {});
  Future<void> goToDebugPlatformSelectorScreen() async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugPlatformSelectorScreen,
        arguments: {},
      );
  Future<void> goToDebugScreen() async => navigatorKey.currentState
      ?.pushNamed<dynamic>(RouteNames.debugScreen, arguments: {});
  void goBack() => navigatorKey.currentState?.pop();
  void goBackWithResult<T>({T? result}) =>
      navigatorKey.currentState?.pop(result);
  void popUntil(bool Function(Route<dynamic>) predicate) =>
      navigatorKey.currentState?.popUntil(predicate);
  void goBackTo(String routeName) =>
      popUntil((route) => route.settings.name?.split('?').first == routeName);
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

  /// /log-detail
  static const logDetailScreen = '/log-detail';

  /// /todo-add
  static const todoAddScreen = '/todo-add';

  /// /logs
  static const logsScreen = '/logs';

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
}
