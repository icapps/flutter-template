import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:mockito/mockito.dart';

class MockTodoListViewModel extends Mock with ChangeNotifier implements TodoListViewModel {}
