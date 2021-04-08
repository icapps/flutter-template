import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoAddViewModel with ChangeNotifierEx {
  final TodoRepo todoRepo;
  late TodoAddNavigator _navigator;
  String? _todo;

  TodoAddViewModel(this.todoRepo);

  bool get isSaveEnabled => _todo?.isNotEmpty == true;

  Future<void> init(TodoAddNavigator navigator) async {
    _navigator = navigator;
  }

  void onTodoChanged(String todo) {
    _todo = todo.trim();
    notifyListeners();
  }

  void onBackClicked() => _navigator.goBack<void>();

  Future<void> onSaveClicked() async {
    final todo = _todo;
    if (todo == null) {
      _navigator.showError('Todo should not be empty');
      return;
    }
    await todoRepo.saveTodo(todo);
    _navigator.goBack(result: true);
  }
}

abstract class TodoAddNavigator implements BackNavigator, ErrorNavigator {}
