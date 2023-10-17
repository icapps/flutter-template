import 'dart:async';

import 'package:flutter_template/database/todo/todo_dao_storage.dart';
import 'package:flutter_template/model/error_handling/result.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/error_handling/error_handling_repository_mixin.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class TodoRepository {
  @factoryMethod
  factory TodoRepository(TodoService service, TodoDaoStorage storage) = _TodoRepository;

  Stream<List<Todo>> getTodos();

  Future<Result<List<Todo>>> fetchTodos();

  Future<void> saveTodo(String todo);

  Future<void> setTodoState({required int id, required bool value});
}

class _TodoRepository with ErrorHandlingRepositoryMixin implements TodoRepository {
  final TodoDaoStorage _todoDao;
  final TodoService _todoService;

  _TodoRepository(this._todoService, this._todoDao);

  @override
  Stream<List<Todo>> getTodos() => _todoDao.getAllTodosStream();

  ///Get Users will be requested from
  ///https://jsonplaceholder.typicode.com/todos
  @override
  Future<Result<List<Todo>>> fetchTodos() => fetch(
        errorMessage: 'Failed to fetch todos',
        function: () async {
          final data = await _todoService.getTodos();
          for (final todo in data) {
            await _todoDao.createTodoWithValue(todo);
          }
          return data;
        },
      );

  @override
  Future<void> saveTodo(String todo) async {
    await _todoDao.createTodo(todo);
  }

  @override
  Future<void> setTodoState({required int id, required bool value}) async {
    await _todoDao.updateTodo(id: id, completed: value);
  }
}
