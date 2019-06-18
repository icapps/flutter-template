import 'package:dio/dio.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/repository/user_repository.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/logger/logger.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/locale/locale_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(UserRepository)
  @Register.singleton(LocaleRepository)
  void registerCommonDependencies();

  @Register.factory(HomeViewModel)
  @Register.factory(SplashViewModel)
  @Register.factory(LocaleViewModel)
  void registerViewModelFactories();
}

void setupDependencyTree() {
  final injector = _$Injector();
  Container().registerSingleton((c) => provideDio());
  injector
    ..registerCommonDependencies()
    ..registerViewModelFactories();
}

Dio provideDio() {
  final dio = Dio();
  dio.options.baseUrl = FlavorConfig.instance.values.baseUrl;
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options) {
      Logger.logNetworkRequest(options);
      return options;
    },
    onResponse: (response) {
      Logger.logNetworkResponse(response);
      return response;
    },
    onError: (error) {
      Logger.logNetworkError(error);
      return error;
    },
  ));
  return dio;
}
