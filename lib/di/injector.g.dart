// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
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
    container.registerSingleton<TodoDaoStoring>(
        (c) => TodoDaoStorage(c<FlutterTemplateDatabase>()));
  }

  void registerBridge() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<LoggingBridging>((c) => LoggingBridge());
  }

  void registerWebservices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService>((c) => TodoWebService(c<Dio>()));
  }

  void registerDummyServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoService>((c) => TodoDummyService());
  }

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

  void registerThirdPartyServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => FlutterSecureStorage());
    container.registerSingleton((c) => Connectivity());
  }

  void registerBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) =>
        GlobalCubit(debugRepo: c<DebugRepo>(), localeRepo: c<LocaleRepo>()));
  }
}
