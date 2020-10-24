// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
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

  @override
  void registerDatabase() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoDaoStoring>(
        (c) => TodoDaoStorage(c<FlutterTemplateDatabase>()));
  }

  @override
  void registerBridge() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<LoggingBridging>((c) => LoggingBridge());
  }

  @override
  void registerWebservices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService>((c) => TodoWebService(c<Dio>()));
  }

  @override
  void registerDummyServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService>((c) => TodoDummyService());
  }

  @override
  void registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoRepo>(
        (c) => TodoRepository(c<TodoService>(), c<TodoDaoStoring>()));
    container
        .registerSingleton<LoginRepo>((c) => LoginRepository(c<AuthStoring>()));
    container.registerSingleton<RefreshRepo>(
        (c) => RefreshRepository(c<AuthStoring>()));
    container.registerSingleton<DebugRepo>(
        (c) => DebugRepository(c<SharedPrefsStoring>()));
    container.registerSingleton<LocaleRepo>(
        (c) => LocaleRepository(c<SharedPrefsStoring>()));
  }

  @override
  void registerCommonDependencies() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<SharedPrefsStoring>(
        (c) => SharedPrefsStorage(c<SharedPreferences>()));
    container.registerSingleton<LocalStoring>(
        (c) => LocalStorage(c<AuthStoring>(), c<SharedPrefsStoring>()));
    container.registerSingleton<SecureStoring>(
        (c) => SecureStorage(c<FlutterSecureStorage>()));
    container
        .registerSingleton<AuthStoring>((c) => AuthStorage(c<SecureStoring>()));
    container.registerSingleton<ConnectivityControlling>(
        (c) => ConnectivityController(c<Connectivity>()));
  }

  @override
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

  @override
  void registerThirdPartyServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => FlutterSecureStorage());
    container.registerSingleton((c) => Connectivity());
  }
}
