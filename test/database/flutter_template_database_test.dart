import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_test/flutter_test.dart';

/// The schema version of the database that is being tested.
/// Update this when a new migration is added.
/// Also run ./tool/save_database_schema.sh to create the latest version schema file.
const schemaVersion = 32;

void main() {
  late FlutterTemplateDatabase sut;

  setUp(() async {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    sut = FlutterTemplateDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await sut.deleteAllData();
  });

  test('FlutterTemplateDatabase should have the correct version', () {
    expect(sut.schemaVersion, schemaVersion);
  });

  test('FlutterTemplateDatabase should delete all tables', () async {
    final resultTodos1 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos1.isEmpty, true);

    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo1', completed: true));
    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo2', completed: true));
    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo3', completed: true));

    final resultTodos2 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos2.isEmpty, false);
    expect(resultTodos2.length, 3);

    await sut.deleteAllData();

    final resultTodos3 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos3.isEmpty, true);
  });
}
