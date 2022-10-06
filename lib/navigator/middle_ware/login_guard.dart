import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';

class LoginGuard extends GetMiddleware {
  final authStorage = GetIt.I.get<AuthStorage>();

  @override
  RouteSettings? redirect(String? route) {
    if (FlavorConfig.isInTest()) return null;
    final isLoggedIn = authStorage.isLoggedIn;
    return isLoggedIn ? const RouteSettings(name: RouteNames.homeScreen) : null;
  }
}
