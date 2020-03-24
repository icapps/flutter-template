import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:retrofit/retrofit.dart';

part 'todo_webservice.g.dart';

@RestApi()
abstract class TodoWebService extends TodoService {
  factory TodoWebService(Dio dio) = _TodoWebService;

  @override
  @GET('/todos')
  Future<List<Todo>> getTodos();
}
