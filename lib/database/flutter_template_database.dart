import 'package:flutter_template/model/database/todo/db_todo_table.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';

part 'flutter_template_database.g.dart';

@test
@singleton
@UseMoor(tables: [
  DbTodoTable,
])
class FlutterTemplateDatabase extends _$FlutterTemplateDatabase {
  FlutterTemplateDatabase(QueryExecutor db) : super(db);

  FlutterTemplateDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}
