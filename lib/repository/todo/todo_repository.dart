import 'package:flutter_template/database/todo/todo_dao_storage.dart';
import 'package:flutter_template/model/database/todo/db_todo_table.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class TodoRepository {
  @factoryMethod
  factory TodoRepository(TodoService service, TodoDaoStorage storage) = _TodoRepository;

  Stream<List<Todo>> getTodos();

  Future<List<Todo>> fetchTodos();

  Future<void> saveTodo(String todo);

  Future<void> setTodoState({required int id, required bool value});
}

class _TodoRepository implements TodoRepository {
  final TodoDaoStorage _todoDao;
  final TodoService _todoService;

  _TodoRepository(this._todoService, this._todoDao);

  @override
  Stream<List<Todo>> getTodos() => _todoDao.getAllTodosStream().map((list) => list.map((item) => item.getModel()).toList());

  ///Get Users will be requested from
  ///https://jsonplaceholder.typicode.com/todos
  @override
  Future<List<Todo>> fetchTodos() async {
    final results = await _todoService.getTodos();
    for (final todo in results) {
      await _todoDao.createTodoWithValue(todo);
    }
    return results;
  }

  @override
  Future<void> saveTodo(String todo) async {
    await _todoDao.createTodo(todo);
  }

  @override
  Future<void> setTodoState({required int id, required bool value}) async {
    await _todoDao.updateTodo(id: id, completed: value);
  }
}
