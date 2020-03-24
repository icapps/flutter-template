abstract class LoginRepo {
  Future<bool> isLoggedIn();

  Future<void> login();
}
