import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@injectable
class MockTodoService extends Mock implements TodoService {}
