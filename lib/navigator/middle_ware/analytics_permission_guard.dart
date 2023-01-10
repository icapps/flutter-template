import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.get_x_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class AnalyticsPermissionGuard extends GetMiddleware {
  final localStorage = getIt.get<LocalStorage>();

  @override
  RouteSettings? redirect(String? route) {
    if (FlavorConfig.isInTest()) return null;
    return localStorage.hasAnalyticsPermission != true ? const RouteSettings(name: RouteNames.analyticsPermissionScreen) : null;
  }
}
