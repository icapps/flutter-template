import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storage.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:mockito/mockito.dart';

class MockTodoDaoStorage extends Mock implements TodoDaoStorage {
  @override
  Future<void> createTodoWithValue(Todo? todo) async {
    noSuchMethod(Invocation.method(#createTodoWithValue, [todo]));
  }

  @override
  Stream<List<DbTodo>> getAllTodosStream() {
    // ignore: avoid_as
    return noSuchMethod(Invocation.method(#getAllTodosStream, []), returnValue: Stream.value(<DbTodo>[])) as Stream<List<DbTodo>>;
  }

  @override
  Future<void> createTodo(String todo) async {
    noSuchMethod(Invocation.method(#createTodo, [todo]));
  }

  @override
  Future<void> updateTodo({required int id, required bool completed}) async {
    noSuchMethod(Invocation.method(#updateTodo, [id, completed]));
  }
}