import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/mixin/error_handling_mixin.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoListViewModel with ChangeNotifierEx, ErrorHandlingViewModelMixin {
  final MainNavigator _navigator;
  final TodoRepository _todoRepo;

  late Stream<List<Todo>> _todoStream;

  var _isLoading = false;

  String? _errorKey;

  bool get isLoading => _isLoading;

  String? get errorKey => _errorKey;

  Stream<List<Todo>> get dataStream => _todoStream;

  TodoListViewModel(
    this._todoRepo,
    this._navigator,
  );

  Future<void> init() async {
    _todoStream = _todoRepo.getTodos();
  }

  Future<void> onDownloadClicked() => failableFuture(
        _todoRepo.fetchTodos,
        onError: (error) => _errorKey = _getErrorKeyFromError(error),
        onLoadingChanged: (isLoading) => _isLoading = isLoading,
      );

  String _getErrorKeyFromError(dynamic error) => error is LocalizedError ? error.getLocalizedKey() : LocalizationKeys.errorGeneral;

  Future<void> onTodoChanged({required int? id, required bool value}) async {
    if (id == null) return;
    await _todoRepo.setTodoState(id: id, value: value);
  }

  void onAddClicked() => _navigator.goToTodoAddScreen();
}
