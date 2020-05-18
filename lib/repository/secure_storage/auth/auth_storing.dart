import 'package:flutter/widgets.dart';

abstract class AuthStoring {
  Future<String> getRefreshToken();

  Future<String> getAccessToken();

  Future<void> clear();

  Future<void> saveUserCredentials({@required String accessToken, @required String refreshToken});

  Future<bool> hasLoggedInUser();

}
