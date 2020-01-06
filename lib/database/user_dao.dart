import 'package:flutter_template/database/user_database.dart';
import 'package:flutter_template/model/database/user_db.dart';
import 'package:moor/moor.dart';

part 'user_dao.g.dart';

@UseDao(tables: [
  DbUserTable,
])
class UserDao extends DatabaseAccessor<UserDatabase> with _$UserDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  UserDao(UserDatabase db) : super(db);

  Future<List<DbUser>> getAllUsers() => select(db.dbUserTable).get();
}
