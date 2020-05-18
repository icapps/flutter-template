// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void registerNetworkDependencies() {
    final Container container = Container();
    container.registerSingleton((c) => NetworkLogInterceptor());
  }

  void registerDatabase() {
    final Container container = Container();
    container.registerSingleton<TodoDaoStoring, TodoDaoStorage>(
        (c) => TodoDaoStorage(c<FlutterTemplateDatabase>()));
  }

  void registerWebservices() {
    final Container container = Container();
    container.registerSingleton<TodoService, TodoWebService>(
        (c) => TodoWebService(c<Dio>()));
  }

  void registerDummyServices() {
    final Container container = Container();
    container.registerSingleton<TodoService, TodoDummyService>(
        (c) => TodoDummyService());
  }

  void registerRepositories() {
    final Container container = Container();
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
    final Container container = Container();
    container.registerSingleton<SharedPrefsStoring, SharedPrefsStorage>(
        (c) => SharedPrefsStorage(c<SharedPreferences>()));
    container
        .registerSingleton<ConnectivityControlling, ConnectivityController>(
            (c) => ConnectivityController(c<Connectivity>()));
    container.registerSingleton<SecureStoring, SecureStorage>(
        (c) => SecureStorage(c<FlutterSecureStorage>()));
    container.registerSingleton<AuthStoring, AuthStorage>(
        (c) => AuthStorage(c<SecureStoring>()));
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

  void registerThirdPartyServices() {
    final Container container = Container();
    container.registerSingleton((c) => FlutterSecureStorage());
    container.registerSingleton((c) => Connectivity());
  }
}
