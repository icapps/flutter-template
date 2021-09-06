import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/api/dummy_api_util.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:injectable/injectable.dart';

@dummy
@Singleton(as: TodoService)
class TodoDummyService extends TodoService {
  final todos = <Todo>[];

  @override
  Future<List<Todo>> getTodos() async {
    await Future<void>.delayed(ThemeDurations.demoNetworkCallDuration());
    if (todos.isEmpty) {
      final result = await DummyApiUtil.getResponse<List<dynamic>>('todos');
      final newTodos = result.map((dynamic item) => Todo.fromJson(item as Map<String, dynamic>)).toList();
      todos.addAll(newTodos);
    }
    return todos;
  }
}
