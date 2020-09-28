// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerMocks() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => MockFlutterSecureStorage());
    container.registerSingleton((c) => MockSharedPreferences());
    container.registerSingleton<Dio>((c) => MockDio());
  }

  void registerDatabase() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton((c) => FlutterTemplateDatabase(c<QueryExecutor>()));
    container.registerSingleton<TodoDaoStoring>((c) => MockTodoDaoStorage());
  }

  void registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<LoginRepo>((c) => MockLoginRepository());
    container.registerSingleton<TodoRepo>((c) => MockTodoRepository());
    container.registerSingleton<DebugRepo>((c) => MockDebugRepository());
    container.registerSingleton<LocaleRepo>((c) => MockLocaleRepoitory());
    container.registerSingleton<RefreshRepo>((c) => MockRefreshRepository());
  }

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

  void registerMockServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService>((c) => MockTodoService());
  }

  void registerBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) =>
        GlobalCubit(debugRepo: c<DebugRepo>(), localeRepo: c<LocaleRepo>()));
    container.registerSingleton((c) => LicenseCubit());
    container.registerSingleton((c) => LoginCubit(loginRepo: c<LoginRepo>()));
    container.registerSingleton((c) => SplashCubit(
        loginRepo: c<LoginRepo>(), localStoring: c<LocalStoring>()));
    container.registerSingleton((c) => TodoAddCubit(todoRepo: c<TodoRepo>()));
    container.registerSingleton((c) => TodoListCubit(todoRepo: c<TodoRepo>()));
  }
}
