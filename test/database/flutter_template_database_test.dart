import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_util.dart';

void main() {
  FlutterTemplateDatabase sut;

  setUp(() async {
    await TestKiwiUtil.init();
    sut = TestKiwiUtil.resolve();
  });

  test('FlutterTemplateDatabase should have the correct version', () {
    expect(sut.schemaVersion, 1);
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
