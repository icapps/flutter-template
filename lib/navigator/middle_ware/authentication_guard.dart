import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';

class AuthenticationGuard extends GetMiddleware {
  final authStorage = GetIt.I.get<AuthStorage>();

  @override
  RouteSettings? redirect(String? route) {
    final isLoggedIn = authStorage.isLoggedIn;
    return isLoggedIn ? null : const RouteSettings(name: RouteNames.loginScreen);
  }
}
