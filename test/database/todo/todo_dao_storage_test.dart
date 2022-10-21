import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storage.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';

void main() {
  late FlutterTemplateDatabase database;
  late TodoDaoStorage sut;

  setUp(() async {
    await initTestInjectable();
    database = getIt();
    sut = TodoDaoStorage(database);
  });

  tearDown(() async {
    await database.deleteAllData();
  });

  group('createTodo && getAllTodos', () {
    test('TodoDaoStorage createTodo & getAllTodos', () async {
      final data = await sut.getAllTodos();
      expect(data.isEmpty, true);
      await sut.createTodo('TODO1');
      final data2 = await sut.getAllTodos();
      expect(data2.isNotEmpty, true);
      expect(data2.length, 1);
      expect(data2[0].title, 'TODO1');
      expect(data2[0].completed, false);
    });
  });

  group('createTodoWithValue && getAllTodos without id', () {
    test('TodoDaoStorage createTodo & getAllTodos', () async {
      final data = await sut.getAllTodos();
      expect(data.isEmpty, true);
      await sut.createTodoWithValue(const Todo(id: null, title: 'TODO1', completed: true));
      final data2 = await sut.getAllTodos();
      expect(data2.isNotEmpty, true);
      expect(data2.length, 1);
      expect(data2[0].title, 'TODO1');
      expect(data2[0].completed, true);
    });

    test('TodoDaoStorage createTodo & getAllTodos', () async {
      final data = await sut.getAllTodos();
      expect(data.isEmpty, true);
      await sut.createTodoWithValue(const Todo(id: 12345, title: 'TODO1', completed: true));
      final data2 = await sut.getAllTodos();
      expect(data2.isNotEmpty, true);
      expect(data2.length, 1);
      expect(data2[0].title, 'TODO1');
      expect(data2[0].completed, true);
    });
  });

  group('updateTodo', () {
    test('TodoDaoStorage createTodo & updateTodo & getAllTodos', () async {
      final data = await sut.getAllTodos();
      expect(data.isEmpty, true);
      await sut.createTodo('TODO1');
      final data2 = await sut.getAllTodos();
      expect(data2.isNotEmpty, true);
      expect(data2.length, 1);
      expect(data2[0].title, 'TODO1');
      expect(data2[0].completed, false);

      //UPDATE
      await sut.updateTodo(id: data2[0].id, completed: true);
      final data3 = await sut.getAllTodos();
      expect(data3.isNotEmpty, true);
      expect(data3.length, 1);
      expect(data3[0].title, 'TODO1');
      expect(data3[0].completed, true);
    });
  });

  group('getAllTodosStream', () {
    test('TodoDaoStorage getStream updates', () async {
      final stream = sut.getAllTodosStream();
      final initialData = await stream.first;
      expect(initialData.isEmpty, true);
    });

    group('Add data', () {
      late Stream<List<DbTodo>> stream;

      setUp(() async {
        stream = sut.getAllTodosStream();
      });

      test('TodoDaoStorage add 2 todos', () async {
        await sut.createTodo('TODO1');
        final addData = await stream.first;
        expect(addData.length, 1);
        expect(addData[0].title, 'TODO1');
        expect(addData[0].completed, false);

        await sut.createTodo('TODO2');
        final addData2 = await stream.first;
        expect(addData2.length, 2);
        expect(addData2[0].title, 'TODO1');
        expect(addData2[0].completed, false);
        expect(addData2[1].title, 'TODO2');
        expect(addData2[1].completed, false);
      });
    });
  });
}
