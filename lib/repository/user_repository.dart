import 'dart:convert';

import 'package:flutter_template/model/user/user.dart';
import 'package:flutter_template/repository/api.dart';

class UserRepository {
  final Api _api;

  UserRepository(this._api);

  /**
   * Get Users will be requested from
   * https://jsonplaceholder.typicode.com/users
   */
  Future<List<User>> getUsers() async {
    final jsonStr = await _api.get('users');
    final List<dynamic> list = json.decode(jsonStr);
    return list.map((item) => User.fromJson(item)).toList();
  }
}
