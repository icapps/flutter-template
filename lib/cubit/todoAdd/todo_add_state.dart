part of 'todo_add_cubit.dart';

abstract class TodoAddState extends Equatable {
  const TodoAddState();

  @override
  List<Object> get props => [];
}

class TodoAddInitial extends TodoAddState {}

class TodoAddSaved extends TodoAddState {}
