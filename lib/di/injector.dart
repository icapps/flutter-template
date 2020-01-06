import 'package:dio/dio.dart';
import 'package:flutter_template/database/user_dao.dart';
import 'package:flutter_template/database/user_database.dart';
import 'package:flutter_template/repository/debug_repository.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs.dart';
import 'package:flutter_template/repository/user_repository.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart';
import 'package:flutter_template/util/platform_util.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/webservice/user_webservice.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(NetworkLogInterceptor)
  void registerNetworkDependencies();

  @Register.singleton(UserDatabase)
  @Register.singleton(UserDao)
  void registerDatabase();

  @Register.singleton(UserService, from: UserWebservice)
  void registerWebservices();

  @Register.singleton(UserRepository)
  @Register.singleton(DebugRepository)
  @Register.singleton(LocaleRepository)
  @Register.singleton(PlatformUtil, from: FlutterPlatformUtil)
  @Register.singleton(SharedPrefs, from: FlutterSharedPrefs)
  void registerCommonDependencies();

  @Register.factory(HomeViewModel)
  @Register.factory(SplashViewModel)
  @Register.factory(GlobalViewModel)
  @Register.factory(DebugViewModel)
  @Register.factory(DebugPlatformSelectorViewModel)
  void registerViewModelFactories();
}

Future<void> setupDependencyTree() async {
  await provideSharedPreferences();
  final injector = _$Injector()..registerNetworkDependencies();
  Container().registerSingleton((c) => provideDio(c.resolve()));
  injector
    ..registerDatabase()
    ..registerWebservices()
    ..registerCommonDependencies()
    ..registerViewModelFactories();
}

Future<void> provideSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Container().registerSingleton((c) => sharedPreferences);
}

Dio provideDio(NetworkLogInterceptor networkInterceptor) {
  final dio = Dio();
  dio.options.baseUrl = FlavorConfig.instance.values.baseUrl;
  dio.interceptors.add(networkInterceptor);
  return dio;
}
