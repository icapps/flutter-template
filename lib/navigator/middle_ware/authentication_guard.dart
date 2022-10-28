import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class AuthenticationGuard extends GetMiddleware {
  final authStorage = getIt.get<AuthStorage>();

  @override
  RouteSettings? redirect(String? route) {
    if (FlavorConfig.isInTest()) return null;
    final isLoggedIn = authStorage.isLoggedIn;
    return isLoggedIn ? null : const RouteSettings(name: RouteNames.loginScreen);
  }
}
