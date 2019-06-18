import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/model/user/user.dart';

class UserRepository {
  final Dio dio;

  UserRepository(this.dio);

  /**
   * Get Users will be requested from
   * https://jsonplaceholder.typicode.com/users
   */
  Future<List<User>> getUsers(CancelToken cancelToken) async {
    final response = await dio.get<String>('/users', cancelToken: cancelToken);
    final jsonStr = response.data;
    final List<dynamic> list = json.decode(jsonStr);
    return list.map((item) => User.fromJson(item)).toList();
  }
}
