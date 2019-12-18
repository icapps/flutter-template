import 'package:dio/dio.dart';
import 'package:flutter_template/model/user/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_webservice.g.dart';

abstract class UserService {
  Future<List<User>> getUsers();
}

@RestApi()
abstract class UserWebservice extends UserService {
  factory UserWebservice(Dio dio) = _UserWebservice;

  @override
  @GET('/users')
  Future<List<User>> getUsers();
}
