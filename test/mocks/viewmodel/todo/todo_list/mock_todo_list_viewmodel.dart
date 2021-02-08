import 'package:flutter/cupertino.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

@injectable
class MockTodoListViewModel extends Mock with ChangeNotifier implements TodoListViewModel {}
