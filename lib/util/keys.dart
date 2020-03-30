import 'package:flutter/cupertino.dart';

class Keys {
  Keys._();

  //General
  static const backButton = ValueKey('back_button');

  //Debug
  static const targetPlatform = ValueKey('targetPlatform');

  //Login
  static const emailInput = ValueKey('email_input');
  static const passwordInput = ValueKey('password_input');
  static const loginButton = ValueKey('login_button');
}
