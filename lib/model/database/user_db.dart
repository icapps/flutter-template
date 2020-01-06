import 'package:moor/moor.dart';

@DataClassName('DbUser')
class DbUserTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get userName => text()();
}
