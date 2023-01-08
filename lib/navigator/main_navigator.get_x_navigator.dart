// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GetXNavigationConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i2;
import 'package:get/route_manager.dart';

import '../screen/debug/debug_platform_selector_screen.dart' as _i13;
import '../screen/debug/debug_screen.dart' as _i14;
import '../screen/home/home_screen.dart' as _i1;
import '../screen/license/license_screen.dart' as _i6;
import '../screen/login/login_screen.dart' as _i9;
import '../screen/permission/analytics_permission_screen.dart' as _i8;
import '../screen/splash/splash_screen.dart' as _i5;
import '../screen/theme_mode/theme_mode_selector.dart' as _i11;
import '../screen/todo/todo_add/todo_add_screen.dart' as _i7;
import 'middle_ware/analytics_permission_guard.dart' as _i4;
import 'middle_ware/authentication_guard.dart' as _i3;
import 'middle_ware/debug_guard.dart' as _i12;
import 'middle_ware/login_guard.dart' as _i10;

class BaseNavigator {
  static final pages = [
    GetPage<dynamic>(
      name: RouteNames.homeScreen,
      page: () => _i1.HomeScreen(key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [
        _i3.AuthenticationGuard(),
        _i4.AnalyticsPermissionGuard(),
      ],
    ),
    GetPage<dynamic>(
      name: RouteNames.splashScreen,
      page: () => _i5.SplashScreen(key: (Get.arguments?['key'] as _i2.Key?)),
    ),
    GetPage<dynamic>(
      name: RouteNames.licenseScreen,
      page: () => _i6.LicenseScreen(key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [
        _i3.AuthenticationGuard(),
        _i4.AnalyticsPermissionGuard(),
      ],
    ),
    GetPage<dynamic>(
      name: RouteNames.todoAddScreen,
      page: () => _i7.TodoAddScreen(key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [
        _i3.AuthenticationGuard(),
        _i4.AnalyticsPermissionGuard(),
      ],
    ),
    GetPage<dynamic>(
      name: RouteNames.analyticsPermissionScreen,
      page: () => _i8.AnalyticsPermissionScreen(
          key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [_i3.AuthenticationGuard()],
    ),
    GetPage<dynamic>(
      name: RouteNames.loginScreen,
      page: () => _i9.LoginScreen(key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [_i10.LoginGuard()],
    ),
    GetPage<dynamic>(
      name: RouteNames.themeModeSelectorScreen,
      page: () => _i11.ThemeModeSelectorScreen(
          key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [
        _i3.AuthenticationGuard(),
        _i4.AnalyticsPermissionGuard(),
        _i12.DebugGuard(),
      ],
    ),
    GetPage<dynamic>(
      name: RouteNames.debugPlatformSelectorScreen,
      page: () => _i13.DebugPlatformSelectorScreen(
          key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [
        _i3.AuthenticationGuard(),
        _i4.AnalyticsPermissionGuard(),
        _i12.DebugGuard(),
      ],
    ),
    GetPage<dynamic>(
      name: RouteNames.debugScreen,
      page: () => _i14.DebugScreen(key: (Get.arguments?['key'] as _i2.Key?)),
      middlewares: [
        _i3.AuthenticationGuard(),
        _i4.AnalyticsPermissionGuard(),
        _i12.DebugGuard(),
      ],
    ),
  ];

  Future<void> goToHomeScreen({_i2.Key? key}) async => Get.offAllNamed<dynamic>(
        RouteNames.homeScreen,
        arguments: {'key': key},
      );
  Future<void> goToSplashScreen({_i2.Key? key}) async =>
      Get.offAllNamed<dynamic>(
        RouteNames.splashScreen,
        arguments: {'key': key},
      );
  Future<void> goToLicenseScreen({_i2.Key? key}) async => Get.toNamed<dynamic>(
        RouteNames.licenseScreen,
        arguments: {'key': key},
      );
  Future<void> goToTodoAddScreen({_i2.Key? key}) async => Get.toNamed<dynamic>(
        RouteNames.todoAddScreen,
        arguments: {'key': key},
      );
  Future<void> goToAnalyticsPermissionScreen({_i2.Key? key}) async =>
      Get.toNamed<dynamic>(
        RouteNames.analyticsPermissionScreen,
        arguments: {'key': key},
      );
  Future<void> goToLoginScreen({_i2.Key? key}) async =>
      Get.offAllNamed<dynamic>(
        RouteNames.loginScreen,
        arguments: {'key': key},
      );
  Future<void> goToThemeModeSelectorScreen({_i2.Key? key}) async =>
      Get.toNamed<dynamic>(
        RouteNames.themeModeSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugPlatformSelectorScreen({_i2.Key? key}) async =>
      Get.toNamed<dynamic>(
        RouteNames.debugPlatformSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugScreen({_i2.Key? key}) async => Get.toNamed<dynamic>(
        RouteNames.debugScreen,
        arguments: {'key': key},
      );
  void goBack<T>({T? result}) => Get.back<T>(result: result);
  Future<T?> showCustomDialog<T>({_i2.Widget? widget}) async =>
      Get.dialog<T>(widget ?? const _i2.SizedBox.shrink());
}

class RouteNames {
  static const homeScreen = '/HomeScreen';

  static const splashScreen = '/SplashScreen';

  static const licenseScreen = '/LicenseScreen';

  static const todoAddScreen = '/TodoAddScreen';

  static const analyticsPermissionScreen = '/AnalyticsPermissionScreen';

  static const loginScreen = '/LoginScreen';

  static const themeModeSelectorScreen = '/ThemeModeSelectorScreen';

  static const debugPlatformSelectorScreen = '/DebugPlatformSelectorScreen';

  static const debugScreen = '/DebugScreen';
}
