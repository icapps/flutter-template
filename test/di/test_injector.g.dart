// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerWebservices() {
    final Container container = Container();
    container.registerSingleton<UserService, TestUserService>(
        (c) => TestUserService());
  }

  void registerCommonDependencies() {
    final Container container = Container();
    container.registerSingleton((c) => UserRepository(c<UserService>()));
    container.registerSingleton(
        (c) => DebugRepository(c<PlatformUtil>(), c<SharedPrefs>()));
    container.registerSingleton((c) => LocaleRepository(c<SharedPrefs>()));
    container.registerSingleton<SharedPrefs, TestSharedPrefs>(
        (c) => TestSharedPrefs());
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory((c) => HomeViewModel(c<UserRepository>()));
    container.registerFactory((c) => SplashViewModel());
    container.registerFactory(
        (c) => GlobalViewModel(c<LocaleRepository>(), c<DebugRepository>()));
    container.registerFactory((c) => DebugViewModel(c<DebugRepository>()));
    container.registerFactory((c) => DebugPlatformSelectorViewModel());
  }
}
