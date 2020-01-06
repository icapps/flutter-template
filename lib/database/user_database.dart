import 'dart:io';

import 'package:flutter_template/model/database/user_db.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'user_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [
  DbUserTable,
])
class UserDatabase extends _$UserDatabase {
  UserDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
