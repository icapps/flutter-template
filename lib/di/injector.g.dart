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

  void registerWebservices() {
    final Container container = Container();
    container.registerSingleton<UserService, UserWebservice>(
        (c) => UserWebservice(c<Dio>()));
  }

  void registerCommonDependencies() {
    final Container container = Container();
    container.registerSingleton((c) => UserRepository(c<UserService>()));
    container.registerSingleton(
        (c) => DebugRepository(c<PlatformUtil>(), c<SharedPrefs>()));
    container.registerSingleton((c) => LocaleRepository(c<SharedPrefs>()));
    container.registerSingleton<PlatformUtil, FlutterPlatformUtil>(
        (c) => FlutterPlatformUtil());
    container.registerSingleton<SharedPrefs, FlutterSharedPrefs>(
        (c) => FlutterSharedPrefs(c<SharedPreferences>()));
  }

  void registerViewModelFactories() {
    final Container container = Container();
    container.registerFactory((c) => HomeViewModel(c<UserRepository>()));
    container.registerFactory((c) => SplashViewModel());
    container.registerFactory(
        (c) => GlobalViewModel(c<LocaleRepository>(), c<DebugRepository>()));
    container.registerFactory((c) => DebugViewModel(c<DebugRepository>()));
    container.registerFactory((c) => DebugPlatformSelectorViewModel());
  }
}
