import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoAddViewModel with ChangeNotifierEx {
  final TodoRepository _todoRepo;
  final MainNavigator _navigator;
  String? _todo;

  TodoAddViewModel(
    this._todoRepo,
    this._navigator,
  );

  bool get isSaveEnabled => _todo?.isNotEmpty == true;

  void onTodoChanged(String todo) {
    _todo = todo.trim();
    notifyListeners();
  }

  void onBackClicked() => _navigator.goBack<void>();

  Future<void> onSaveClicked() async {
    final todo = _todo;
    if (todo == null) {
      return _navigator.showError('Todo should not be empty');
    }
    await _todoRepo.saveTodo(todo);
    _navigator.goBack(result: true);
  }
}
