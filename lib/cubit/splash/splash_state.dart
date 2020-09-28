part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class LoadedSplashState extends SplashState {
  final bool isLoggedIn;

  const LoadedSplashState({this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn];
}
