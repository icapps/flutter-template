import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'todo_webservice.g.dart';

@dev
@prod
@Singleton(as: TodoService)
@RestApi()
abstract class TodoWebService extends TodoService {
  @factoryMethod
  factory TodoWebService(Dio dio) = _TodoWebService;

  @override
  @GET('/todos')
  Future<List<Todo>> getTodos();
}
