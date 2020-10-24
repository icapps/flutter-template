// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void registerMocks() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => MockFlutterSecureStorage());
    container.registerSingleton((c) => MockSharedPreferences());
    container.registerSingleton<Dio>((c) => MockDio());
  }

  @override
  void registerDatabase() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton((c) => FlutterTemplateDatabase(c<QueryExecutor>()));
    container.registerSingleton<TodoDaoStoring>((c) => MockTodoDaoStorage());
  }

  @override
  void registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<LoginRepo>((c) => MockLoginRepository());
    container.registerSingleton<TodoRepo>((c) => MockTodoRepository());
    container.registerSingleton<DebugRepo>((c) => MockDebugRepository());
    container.registerSingleton<LocaleRepo>((c) => MockLocaleRepoitory());
    container.registerSingleton<RefreshRepo>((c) => MockRefreshRepository());
  }

  @override
  void registerCommonDependencies() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton<SharedPrefsStoring>((c) => MockSharedPrefsStorage());
    container.registerSingleton<SecureStoring>((c) => MockSecureStorage());
    container.registerSingleton<AuthStoring>((c) => MockAuthStorage());
    container.registerSingleton<LocalStoring>((c) => MockLocalStorage());
    container.registerSingleton<ConnectivityControlling>(
        (c) => MockConnectivityController());
  }

  @override
  void registerMockServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService>((c) => MockTodoService());
  }

  @override
  void registerViewModelFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<GlobalViewModel>((c) => MockGlobalViewModel());
    container.registerSingleton<SplashViewModel>((c) => MockSplashViewModel());
    container.registerSingleton<DebugViewModel>((c) => MockDebugViewModel());
    container.registerSingleton<DebugPlatformSelectorViewModel>(
        (c) => MockDebugPlatformSelectorViewModel());
    container
        .registerSingleton<LicenseViewModel>((c) => MockLicenseViewModel());
    container
        .registerSingleton<TodoListViewModel>((c) => MockTodoListViewModel());
    container
        .registerSingleton<TodoAddViewModel>((c) => MockTodoAddViewModel());
    container.registerSingleton<LoginViewModel>((c) => MockLoginViewModel());
  }
}
