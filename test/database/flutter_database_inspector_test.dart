import 'package:flutter_template/util/database/database_inspector.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
  });

  test('Database inspector should not throw an exception', addDatabaseInspector);
}
