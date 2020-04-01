import 'package:flutter/widgets.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';

abstract class TodoDaoStoring {
  Stream<List<DbTodo>> getAllTodosStream();

  Future<List<DbTodo>> getAllTodos();

  Future<void> createTodo(String todo);

  Future<void> createTodoWithValue(Todo todo);

  Future<void> updateTodo({@required int id, @required bool completed});
}
