part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoadedLoginState extends LoginState {
  // final onEmailUpdated
}

class ErrorLoginState extends LoginState {
  final String message;
  final dynamic error;

  const ErrorLoginState(this.message, this.error);

  @override
  List<Object> get props => [message, error];
}
