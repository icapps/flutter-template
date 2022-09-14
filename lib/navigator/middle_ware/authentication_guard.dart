import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';

class AuthenticationGuard extends GetMiddleware {
  final loginRepository = GetIt.I.get<LoginRepository>();

  @override
  RouteSettings? redirect(String? route) => loginRepository.isLoggedIn ? null : const RouteSettings(name: RouteNames.loginScreen);
}
