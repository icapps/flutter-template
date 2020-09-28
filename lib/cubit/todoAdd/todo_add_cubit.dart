import 'package:bloc/bloc.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:equatable/equatable.dart';

part 'todo_add_state.dart';

class TodoAddCubit extends Cubit<TodoAddState> {
  final TodoRepo todoRepo;

  TodoAddCubit({this.todoRepo}) : super(TodoAddInitial());

  Future<void> saveTodo(String todo) async {
    await todoRepo.saveTodo(todo);
    emit(TodoAddSaved());
  }
}
