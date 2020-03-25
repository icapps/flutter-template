// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerDatabase() {
    final Container container = Container();
    container
        .registerSingleton((c) => FlutterTemplateDatabase(c<QueryExecutor>()));
    container.registerSingleton<TodoDaoStoring, MockTodoDaoStorage>(
        (c) => MockTodoDaoStorage());
  }

  void registerRepositories() {
    final Container container = Container();
    container.registerSingleton<LoginRepo, MockLoginRepository>(
        (c) => MockLoginRepository());
    container.registerSingleton<TodoRepo, MockTodoRepository>(
        (c) => MockTodoRepository());
  }

  void registerMockServices() {
    final Container container = Container();
    container.registerSingleton<TodoService, MockTodoService>(
        (c) => MockTodoService());
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory(
        (c) => GlobalViewModel(c<LocaleRepository>(), c<DebugRepository>()));
    container.registerFactory((c) => SplashViewModel(c<LoginRepo>()));
    container.registerFactory((c) => HomeViewModel());
    container.registerFactory((c) => DebugViewModel(c<DebugRepository>()));
    container.registerFactory((c) => DebugPlatformSelectorViewModel());
    container.registerFactory((c) => LicenseViewModel());
    container.registerFactory((c) => TodoListViewModel(c<TodoRepo>()));
    container.registerFactory((c) => TodoAddViewModel(c<TodoRepo>()));
    container.registerFactory((c) => LoginViewModel(c<LoginRepo>()));
  }
}
