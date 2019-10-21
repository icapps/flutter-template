import 'package:flutter_template/repository/api.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs.dart';
import 'package:flutter_template/repository/user_repository.dart';
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/locale/locale_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:kiwi/kiwi.dart';

import '../repository/test_api.dart';
import '../repository/test_shared_prefs.dart';

part 'test_injector.g.dart';

abstract class Injector {
  @Register.factory(NetworkLogInterceptor)
  void registerNetworkDependencies();

  @Register.singleton(UserRepository)
  @Register.singleton(LocaleRepository)
  @Register.factory(Api, from: TestApi)
  @Register.factory(SharedPrefs, from: TestSharedPrefs)
  void registerCommonDependencies();

  @Register.factory(HomeViewModel)
  @Register.factory(SplashViewModel)
  @Register.factory(LocaleViewModel)
  void registerViewModelFactories();
}

Future<void> setupDependencyTree() async {
  _$Injector()
    ..registerNetworkDependencies()
    ..registerCommonDependencies()
    ..registerViewModelFactories();
}
