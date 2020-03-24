// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerCommonDependencies() {
    final Container container = Container();
    container.registerSingleton(
        (c) => TodoRepository(c<TodoService>(), c<TodoDaoStoring>()));
    container
        .registerSingleton((c) => DebugRepository(c<SharedPrefsStoring>()));
    container
        .registerSingleton((c) => LocaleRepository(c<SharedPrefsStoring>()));
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory((c) => HomeViewModel());
    container.registerFactory((c) => SplashViewModel(c<LoginRepo>()));
    container.registerFactory(
        (c) => GlobalViewModel(c<LocaleRepository>(), c<DebugRepository>()));
    container.registerFactory((c) => DebugViewModel(c<DebugRepository>()));
    container.registerFactory((c) => DebugPlatformSelectorViewModel());
  }
}
