import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:flutter_template/database/flutter_template_database.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/database/todo/mock_todo_dao_storage.dart';
import '../../mocks/webservice/mock_todo_service.dart';
import '../../util/test_extensions.dart';

void main() {
  MockTodoService todoService;
  MockTodoDaoStorage todoDao;
  TodoRepo sut;

  setUp(() async {
    await TestKiwiUtil.init();
    todoService = TestKiwiUtil.resolveAs<TodoService, MockTodoService>();
    todoDao = TestKiwiUtil.resolveAs<TodoDaoStoring, MockTodoDaoStorage>();
    sut = TodoRepository(todoService, todoDao);
  });

  group('getTodos stream', () {
    test('getTodos stream is empty by default', () async {
      when(todoDao.getAllTodosStream()).thenAnswer((_) => Stream.value([]));
      final stream = sut.getTodos();
      final result = await stream.first;
      expect(result.isEmpty, true);
      verify(todoDao.getAllTodosStream()).calledOnce();
      verifyNoMoreInteractions(todoService);
      verifyNoMoreInteractions(todoDao);
    });
    test('getTodos stream with some data', () async {
      when(todoDao.getAllTodosStream()).thenAnswer((_) => Stream.value([
            DbTodo(id: 1, title: 'todo1', completed: true),
            DbTodo(id: 2, title: 'todo2', completed: false),
          ]));
      final stream = sut.getTodos();
      final result = await stream.first;
      expect(result.isNotEmpty, true);
      expect(result.length, 2);
      verify(todoDao.getAllTodosStream()).calledOnce();
      verifyNoMoreInteractions(todoDao);
      verifyZeroInteractions(todoService);
    });
  });

  group('fetchTodos', () {
    test('fetchTodos', () async {
      when(todoService.getTodos()).thenAnswer((_) async => []);
      final data = await sut.fetchTodos();
      expect(data.isEmpty, true);
      verify(todoService.getTodos()).calledOnce();
      verifyNoMoreInteractions(todoService);
      verifyZeroInteractions(todoDao);
    });
    test('fetchTodos', () async {
      when(todoService.getTodos()).thenAnswer((_) async => [
            Todo(id: 1, title: '2', completed: true),
            Todo(id: 3, title: '3', completed: false),
          ]);
      final data = await sut.fetchTodos();
      expect(data.isNotEmpty, true);
      expect(data.length, 2);
      verify(todoService.getTodos()).calledOnce();
      verify(todoDao.createTodoWithValue(any)).calledTwice();
      verifyNoMoreInteractions(todoService);
      verifyNoMoreInteractions(todoDao);
    });
  });

  group('saveTodo', () {
    test('saveTodo', () async {
      when(todoDao.createTodo('todo1')).thenAnswer((_) => Future.value());
      await sut.saveTodo('todo1');
      verify(todoDao.createTodo('todo1')).calledOnce();
      verifyNoMoreInteractions(todoDao);
      verifyZeroInteractions(todoService);
    });
  });

  group('setTodoState', () {
    test('setTodoState', () async {
      when(todoDao.updateTodo(id: 1, completed: true)).thenAnswer((_) => Future.value());
      await sut.setTodoState(id: 1, value: true);
      verify(todoDao.updateTodo(id: 1, completed: true)).calledOnce();
      verifyNoMoreInteractions(todoDao);
      verifyZeroInteractions(todoService);
    });
    test('setTodoState with false', () async {
      when(todoDao.updateTodo(id: 1, completed: false)).thenAnswer((_) => Future.value());
      await sut.setTodoState(id: 1, value: false);
      verify(todoDao.updateTodo(id: 1, completed: false)).calledOnce();
      verifyNoMoreInteractions(todoDao);
      verifyZeroInteractions(todoService);
    });
  });
}
