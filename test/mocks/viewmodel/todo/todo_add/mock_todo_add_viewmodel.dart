import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@test
@Singleton(as: TodoAddViewModel)
class MockTodoAddViewModel extends Mock with ChangeNotifier implements TodoAddViewModel {}
