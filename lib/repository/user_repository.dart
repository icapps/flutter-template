import 'package:flutter_template/model/user/user.dart';
import 'package:flutter_template/webservice/user_webservice.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  /**
   * Get Users will be requested from
   * https://jsonplaceholder.typicode.com/users
   */
  Future<List<User>> getUsers() async => _userService.getUsers();
}
