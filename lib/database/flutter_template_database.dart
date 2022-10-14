import 'package:drift/drift.dart';
import 'package:flutter_template/model/database/todo/db_todo_table.dart';

part 'flutter_template_database.g.dart';

@DriftDatabase(tables: [
  DbTodoTable,
])
class FlutterTemplateDatabase extends _$FlutterTemplateDatabase {
  FlutterTemplateDatabase(super.db);

  FlutterTemplateDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
