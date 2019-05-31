import 'package:dio/dio.dart';
import 'package:flutte_template/repository/user_repository.dart';
import 'package:flutte_template/util/env/flavor_config.dart';
import 'package:flutte_template/util/logger/logger.dart';
import 'package:flutte_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutte_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(UserRepository)
  void registerCommonDependencies();

  @Register.factory(HomeViewModel)
  @Register.factory(SplashViewModel)
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
