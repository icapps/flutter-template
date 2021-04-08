import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:flutter_template/navigator/mixin/error_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoListViewModel with ChangeNotifierEx {
  final TodoRepo _todoRepo;

  late TodoListViewNavigator _navigator;
  late Stream<List<Todo>> _todoStream;

  var _isLoading = false;
  String? _errorKey;

  bool get isLoading => _isLoading;

  String? get errorKey => _errorKey;

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
    } catch (e, stack) {
      logger.error('failed to get todos', error: e, trace: stack);
      if (e is LocalizedError) {
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

  Future<void> onTodoChanged({required int? id, required bool value}) async {
    if (id == null) return;
    await _todoRepo.setTodoState(id: id, value: value);
  }
}

// ignore: one_member_abstracts
abstract class TodoListViewNavigator implements BackNavigator, ErrorNavigator {
  void goToAddTodo();
}
