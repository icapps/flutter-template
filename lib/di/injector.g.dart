// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerNetworkDependencies() {
    final Container container = Container();
    container.registerFactory((c) => NetworkLogInterceptor());
  }

  void registerCommonDependencies() {
    final Container container = Container();
    container.registerSingleton((c) => UserRepository(c<Dio>()));
    container.registerSingleton((c) => LocaleRepository());
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory((c) => HomeViewModel(c<UserRepository>()));
    container.registerFactory((c) => SplashViewModel());
    container.registerFactory((c) => LocaleViewModel(c<LocaleRepository>()));
  }
}
