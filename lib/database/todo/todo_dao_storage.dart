import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/model/database/todo/db_todo_table.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:moor/moor.dart';

part 'todo_dao_storage.g.dart';

@UseDao(tables: [
  DbTodoTable,
])
class TodoDaoStorage extends DatabaseAccessor<FlutterTemplateDatabase> with _$TodoDaoStorageMixin implements TodoDaoStoring {
  TodoDaoStorage(FlutterTemplateDatabase db) : super(db);

  @override
  Future<List<DbTodo>> getAllTodos() => select(db.dbTodoTable).get();

  @override
  Future<void> createTodo(String todo) => into(db.dbTodoTable).insert(DbTodoTableCompanion.insert(title: todo, completed: false));

  @override
  Future<void> updateTodo({@required int id, @required bool completed}) =>
      (update(db.dbTodoTable)..where((todo) => todo.id.equals(id))).write(DbTodoTableCompanion(completed: Value(completed)));

  @override
  Stream<List<DbTodo>> getAllTodosStream() => select(db.dbTodoTable).watch();

  @override
  Future<void> createBackendTodo(Todo todo) async => into(db.dbTodoTable).insert(DbTodoTableCompanion.insert(title: todo.title, completed: todo.completed));

  @override
  Future<void> setTodoState({int id, bool value}) async {
    await (update(db.dbTodoTable)..where((item) => item.id.equals(id))).write(DbTodoTableCompanion(completed: Value(value)));
  }
}
