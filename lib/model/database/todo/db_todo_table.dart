import 'package:drift/drift.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';

@DataClassName('DbTodo')
class DbTodoTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get completed => boolean()();
}

extension DbTodoExtension on DbTodo {
  Todo getModel() => Todo(
        id: id,
        title: title,
        completed: completed,
      );
}

extension TodoExtension on Todo {
  DbTodoTableCompanion getDbModel() {
    final id = this.id;
    return DbTodoTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      title: title,
      completed: completed,
    );
  }
}
