// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerNetworkDependencies() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => NetworkLogInterceptor());
    container
        .registerSingleton((c) => NetworkAuthInterceptor(c<AuthStoring>()));
    container.registerSingleton(
        (c) => NetworkErrorInterceptor(c<ConnectivityControlling>()));
    container.registerSingleton(
        (c) => NetworkRefreshInterceptor(c<AuthStoring>(), c<RefreshRepo>()));
  }

  void registerDatabase() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoDaoStoring, TodoDaoStorage>(
        (c) => TodoDaoStorage(c<FlutterTemplateDatabase>()));
  }

  void registerBridge() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<LoggingBridging, LoggingBridge>(
        (c) => LoggingBridge());
  }

  void registerWebservices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService, TodoWebService>(
        (c) => TodoWebService(c<Dio>()));
  }

  void registerDummyServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService, TodoDummyService>(
        (c) => TodoDummyService());
  }

  void registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoRepo, TodoRepository>(
        (c) => TodoRepository(c<TodoService>(), c<TodoDaoStoring>()));
    container.registerSingleton<LoginRepo, LoginRepository>(
        (c) => LoginRepository(c<AuthStoring>()));
    container.registerSingleton<RefreshRepo, RefreshRepository>(
        (c) => RefreshRepository(c<AuthStoring>()));
    container.registerSingleton<DebugRepo, DebugRepository>(
        (c) => DebugRepository(c<SharedPrefsStoring>()));
    container.registerSingleton<LocaleRepo, LocaleRepository>(
        (c) => LocaleRepository(c<SharedPrefsStoring>()));
  }

  void registerCommonDependencies() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<SharedPrefsStoring, SharedPrefsStorage>(
        (c) => SharedPrefsStorage(c<SharedPreferences>()));
    container.registerSingleton<LocalStoring, LocalStorage>(
        (c) => LocalStorage(c<AuthStoring>(), c<SharedPrefsStoring>()));
    container.registerSingleton<SecureStoring, SecureStorage>(
        (c) => SecureStorage(c<FlutterSecureStorage>()));
    container.registerSingleton<AuthStoring, AuthStorage>(
        (c) => AuthStorage(c<SecureStoring>()));
    container
        .registerSingleton<ConnectivityControlling, ConnectivityController>(
            (c) => ConnectivityController(c<Connectivity>()));
  }

  void registerViewModelFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => GlobalViewModel(c<LocaleRepo>(), c<DebugRepo>()));
    container.registerFactory(
        (c) => SplashViewModel(c<LoginRepo>(), c<LocalStoring>()));
    container.registerFactory((c) => DebugViewModel(c<DebugRepo>()));
    container.registerFactory((c) => DebugPlatformSelectorViewModel());
    container.registerFactory((c) => LicenseViewModel());
    container.registerFactory((c) => TodoListViewModel(c<TodoRepo>()));
    container.registerFactory((c) => TodoAddViewModel(c<TodoRepo>()));
    container.registerFactory((c) => LoginViewModel(c<LoginRepo>()));
  }

  void registerThirdPartyServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => FlutterSecureStorage());
    container.registerSingleton((c) => Connectivity());
  }
}
