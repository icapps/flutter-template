import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';

void main() {
  setUp(() async => initTestInjectable());

  test('TodoTest', () async {
    const todo = Todo(id: 1, title: 'title', completed: true);

    //PARSE TO JSON
    final json = todo.toJson();
    expect(json['id'], todo.id);
    expect(json['title'], todo.title);
    expect(json['completed'], todo.completed);

    //PARSE FROM JSON
    final parsedTodo = Todo.fromJson(json);
    expect(parsedTodo.id, todo.id);
    expect(parsedTodo.title, todo.title);
    expect(parsedTodo.completed, todo.completed);
  });
}
