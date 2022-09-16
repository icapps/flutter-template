import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/model/database/todo/db_todo_table.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getDbModel', () {
    test('Todo getDbModel', () {
      const sut = Todo(
        id: 1,
        title: 'testing',
        completed: true,
      );
      final todo = sut.getDbModel();
      expect(todo.id.value, sut.id);
      expect(todo.title.value, sut.title);
      expect(todo.completed.value, sut.completed);
    });

    test('Todo getDbModel without id', () {
      const sut = Todo(
        id: null,
        title: 'testing',
        completed: true,
      );
      final todo = sut.getDbModel();
      expect(todo.id.present, false);
      expect(todo.title.value, sut.title);
      expect(todo.completed.value, sut.completed);
    });
  });

  group('getModel', () {
    test('Todo getModel', () {
      const sut = DbTodo(
        id: 1,
        title: 'testing',
        completed: true,
      );
      final todo = sut.getModel();
      expect(todo.id, 1);
      expect(todo.title, sut.title);
      expect(todo.completed, sut.completed);
    });
  });
}
