import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/cubit/todoAdd/todo_add_cubit.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final TodoRepo todoRepo;
  final TodoAddCubit todoAddCubit;
  StreamSubscription todosSubscription;

  TodoListCubit({this.todoRepo, this.todoAddCubit}) : super(const TodoListInitial(null)) {
    if (todoAddCubit != null) {
      todosSubscription = todoAddCubit.listen(
        (state) => {if (state is TodoAddSaved) getTodos()},
      );
    }
  }

  @override
  Future<void> close() async {
    await todosSubscription?.cancel();
    await super.close();
  }

  Future<void> todoChanged({@required int id, @required bool completed}) async {
    await todoRepo.setTodoState(id: id, completed: completed);
  }

  Future<void> fetchTodos() async {
    try {
      emit(TodoListLoading());
      await todoRepo.fetchTodos();
      await getTodos();
    } catch (e) {
      FlutterTemplateLogger.logError(message: 'failed to get todos', error: e);
      String errorKey;
      if (e is FlutterTemplateError) {
        errorKey = e.getLocalizedKey();
      } else {
        errorKey = LocalizationKeys.errorGeneral;
      }
      emit(TodoListError(errorKey));
    }
  }

  Future<void> getTodos() async {
    emit(TodoListInitial(todoRepo.getTodos()));
  }
}
