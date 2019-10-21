// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

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
    container.registerSingleton((c) => UserRepository(c<Api>()));
    container.registerSingleton((c) => LocaleRepository(c<SharedPrefs>()));
    container.registerFactory<Api, TestApi>((c) => TestApi());
    container.registerFactory<SharedPrefs, TestSharedPrefs>(
        (c) => TestSharedPrefs());
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory((c) => HomeViewModel(c<UserRepository>()));
    container.registerFactory((c) => SplashViewModel());
    container.registerFactory((c) => LocaleViewModel(c<LocaleRepository>()));
  }
}
