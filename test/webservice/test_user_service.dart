import 'package:flutter_template/model/user/user.dart';
import 'package:flutter_template/webservice/user_webservice.dart';

import 'test_service.dart';

class TestUserService extends UserService with TestServiceMixIn {
  @override
  Future<List<User>> getUsers() async {
    return [];
  }
}
