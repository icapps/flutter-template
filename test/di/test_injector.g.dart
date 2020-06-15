// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerMocks() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => MockFlutterSecureStorage());
    container.registerSingleton((c) => MockSharedPreferences());
    container.registerSingleton<Dio, MockDio>((c) => MockDio());
  }

  void registerDatabase() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton((c) => FlutterTemplateDatabase(c<QueryExecutor>()));
    container.registerSingleton<TodoDaoStoring, MockTodoDaoStorage>(
        (c) => MockTodoDaoStorage());
  }

  void registerRepositories() {
    final KiwiContainer container = KiwiContainer();
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
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<SharedPrefsStoring, MockSharedPrefsStorage>(
        (c) => MockSharedPrefsStorage());
    container.registerSingleton<SecureStoring, MockSecureStorage>(
        (c) => MockSecureStorage());
    container.registerSingleton<AuthStoring, MockAuthStorage>(
        (c) => MockAuthStorage());
    container.registerSingleton<LocalStoring, MockLocalStorage>(
        (c) => MockLocalStorage());
    container.registerSingleton<ConnectivityControlling,
        MockConnectivityController>((c) => MockConnectivityController());
  }

  void registerMockServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService, MockTodoService>(
        (c) => MockTodoService());
  }

  void registerViewModelFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<GlobalViewModel, MockGlobalViewModel>(
        (c) => MockGlobalViewModel());
    container.registerSingleton<SplashViewModel, MockSplashViewModel>(
        (c) => MockSplashViewModel());
    container.registerSingleton<DebugViewModel, MockDebugViewModel>(
        (c) => MockDebugViewModel());
    container.registerSingleton<DebugPlatformSelectorViewModel,
            MockDebugPlatformSelectorViewModel>(
        (c) => MockDebugPlatformSelectorViewModel());
    container.registerSingleton<LicenseViewModel, MockLicenseViewModel>(
        (c) => MockLicenseViewModel());
    container.registerSingleton<TodoListViewModel, MockTodoListViewModel>(
        (c) => MockTodoListViewModel());
    container.registerSingleton<TodoAddViewModel, MockTodoAddViewModel>(
        (c) => MockTodoAddViewModel());
    container.registerSingleton<LoginViewModel, MockLoginViewModel>(
        (c) => MockLoginViewModel());
  }
}
