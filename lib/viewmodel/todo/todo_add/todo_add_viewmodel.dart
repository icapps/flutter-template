import 'package:flutter/material.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_template/viewmodel/error_navigator.dart';

class TodoAddViewModel with ChangeNotifier {
  final TodoRepo todoRepo;
  TodoAddNavigator _navigator;
  String _todo;

  var _saveEnabled = false;

  TodoAddViewModel(this.todoRepo);

  bool get isSaveEnabled => _saveEnabled;

  Future<void> init(TodoAddNavigator navigator) async {
    _navigator = navigator;
  }

  void onTodoChanged(String todo) {
    _todo = todo.trim();
    _saveEnabled = _todo.isNotEmpty;
    notifyListeners();
  }

  void onBackClicked() => _navigator.goBack<void>();

  Future<void> onSaveClicked() async {
    await todoRepo.saveTodo(_todo);
    _navigator.goBack(result: true);
  }
}

abstract class TodoAddNavigator implements BackNavigator, ErrorNavigator {}
