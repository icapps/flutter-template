import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockTodoRepository extends Mock implements TodoRepo {}
