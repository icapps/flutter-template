import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: TodoDaoStoring)
class MockTodoDaoStorage extends Mock implements TodoDaoStoring {}
