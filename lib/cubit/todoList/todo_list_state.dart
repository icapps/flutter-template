part of 'todo_list_cubit.dart';

abstract class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object> get props => [];
}

class TodoListInitial extends TodoListState {
  final Stream<List<Todo>> dataStream;

  const TodoListInitial(this.dataStream);

  @override
  List<Object> get props => [dataStream];
}

class TodoListLoading extends TodoListState {}

class TodoListError extends TodoListState {
  final String errorKey;

  const TodoListError(this.errorKey);

  @override
  List<Object> get props => [errorKey];
}
