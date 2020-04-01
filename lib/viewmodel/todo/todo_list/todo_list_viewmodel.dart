import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_template/viewmodel/error_navigator.dart';

class TodoListViewModel with ChangeNotifier {
  final TodoRepo _todoRepo;

  TodoListViewNavigator _navigator;

  var _isLoading = false;
  String _errorKey;

  Stream<List<Todo>> _todoStream;

  bool get isLoading => _isLoading;

  String get errorKey => _errorKey;

  Stream<List<Todo>> get dataStream => _todoStream;

  TodoListViewModel(this._todoRepo);

  Future<void> init(TodoListViewNavigator navigator) async {
    _navigator = navigator;
    _todoStream = _todoRepo.getTodos();
  }

  Future<void> onDownloadClicked() async {
    try {
      _isLoading = true;
      _errorKey = null;
      notifyListeners();
      await _todoRepo.fetchTodos();
    } catch (e) {
      FlutterTemplateLogger.logError(message: 'failed to get todos', error: e);
      if (e is FlutterTemplateError) {
        _errorKey = e.getLocalizedKey();
      } else {
        _errorKey = LocalizationKeys.errorGeneral;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void onAddClicked() => _navigator.goToAddTodo();

  Future<void> onTodoChanged({@required int id, @required bool value}) async {
    await _todoRepo.setTodoState(id: id, value: value);
  }
}

// ignore: one_member_abstracts
abstract class TodoListViewNavigator implements BackNavigator, ErrorNavigator {
  void goToAddTodo();
}
