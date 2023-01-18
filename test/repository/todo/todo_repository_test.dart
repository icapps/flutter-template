import 'package:flutter_template/database/todo/todo_dao_storage.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'todo_repository_test.mocks.dart';

@GenerateMocks([
  TodoService,
  TodoDaoStorage,
])
void main() {
  late TodoService todoService;
  late TodoDaoStorage todoDao;
  late TodoRepository sut;

  setUp(() async {
    todoService = MockTodoService();
    todoDao = MockTodoDaoStorage();
    sut = TodoRepository(todoService, todoDao);
  });

  tearDown(() {
    verifyNoMoreInteractions(todoService);
    verifyNoMoreInteractions(todoDao);
  });

  group('getTodos stream', () {
    test('getTodos stream is empty by default', () async {
      when(todoDao.getAllTodosStream()).thenAnswer((_) => Stream.value(<Todo>[]));
      final stream = sut.getTodos();
      final result = await stream.first;
      expect(result.isEmpty, true);
      verify(todoDao.getAllTodosStream()).calledOnce();
    });
    test('getTodos stream with some data', () async {
      when(todoDao.getAllTodosStream()).thenAnswer((_) => Stream.value(<Todo>[
            const Todo(id: 1, title: 'todo1', completed: true),
            const Todo(id: 2, title: 'todo2', completed: false),
          ]));
      final stream = sut.getTodos();
      final result = await stream.first;
      expect(result.isNotEmpty, true);
      expect(result.length, 2);
      verify(todoDao.getAllTodosStream()).calledOnce();
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
            const Todo(id: 1, title: '2', completed: true),
            const Todo(id: 3, title: '3', completed: false),
          ]);
      final data = await sut.fetchTodos();
      expect(data.isNotEmpty, true);
      expect(data.length, 2);
      verify(todoService.getTodos()).calledOnce();
      verify((todoDao as MockTodoDaoStorage).createTodoWithValue(any)).calledTwice();
    });
  });

  group('saveTodo', () {
    test('saveTodo', () async {
      when(todoDao.createTodo('todo1')).thenAnswer((_) => Future.value());
      await sut.saveTodo('todo1');
      verify(todoDao.createTodo('todo1')).calledOnce();
    });
  });

  group('setTodoState', () {
    test('setTodoState', () async {
      when(todoDao.updateTodo(id: 1, completed: true)).thenAnswer((_) => Future.value());
      await sut.setTodoState(id: 1, value: true);
      verify(todoDao.updateTodo(id: 1, completed: true)).calledOnce();
    });
    test('setTodoState with false', () async {
      when(todoDao.updateTodo(id: 1, completed: false)).thenAnswer((_) => Future.value());
      await sut.setTodoState(id: 1, value: false);
      verify(todoDao.updateTodo(id: 1, completed: false)).calledOnce();
    });
  });
}
