import 'package:flutter/cupertino.dart';

abstract class LoginRepo {
  Future<bool> isLoggedIn();

  Future<void> login({@required String email, @required String password});
}
