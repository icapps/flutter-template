// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerMocks() {
    final Container container = Container();
    container.registerSingleton((c) => MockFlutterSecureStorage());
    container.registerSingleton((c) => MockSharedPreferences());
    container.registerSingleton<Dio, MockDio>((c) => MockDio());
  }

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
    container.registerSingleton<DebugRepo, MockDebugRepository>(
        (c) => MockDebugRepository());
    container.registerSingleton<LocaleRepo, MockLocaleRepoitory>(
        (c) => MockLocaleRepoitory());
    container.registerSingleton<RefreshRepo, MockRefreshRepository>(
        (c) => MockRefreshRepository());
  }

  void registerCommonDependencies() {
    final Container container = Container();
    container.registerSingleton<SharedPrefsStoring, MockSharedPrefsStorage>(
        (c) => MockSharedPrefsStorage());
    container.registerSingleton<SecureStoring, MockSecureStorage>(
        (c) => MockSecureStorage());
    container.registerSingleton<AuthStoring, MockAuthStorage>(
        (c) => MockAuthStorage());
  }

  void registerMockServices() {
    final Container container = Container();
    container.registerSingleton<TodoService, MockTodoService>(
        (c) => MockTodoService());
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory(
        (c) => GlobalViewModel(c<LocaleRepo>(), c<DebugRepo>()));
    container.registerFactory((c) => SplashViewModel(c<LoginRepo>()));
    container.registerFactory((c) => DebugViewModel(c<DebugRepo>()));
    container.registerFactory((c) => DebugPlatformSelectorViewModel());
    container.registerFactory((c) => LicenseViewModel());
    container.registerFactory((c) => TodoListViewModel(c<TodoRepo>()));
    container.registerFactory((c) => TodoAddViewModel(c<TodoRepo>()));
    container.registerFactory((c) => LoginViewModel(c<LoginRepo>()));
  }
}
