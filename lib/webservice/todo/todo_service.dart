import 'package:flutter_template/model/webservice/todo/todo.dart';

// ignore: one_member_abstracts
abstract class TodoService {
  Future<List<Todo>> getTodos();
}
