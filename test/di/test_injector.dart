import 'package:flutter_template/repository/debug_repository.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/repository/shared_prefs.dart';
import 'package:flutter_template/repository/user_repository.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/webservice/user_webservice.dart';
import 'package:kiwi/kiwi.dart';

import '../repository/test_shared_prefs.dart';
import '../webservice/test_user_service.dart';

part 'test_injector.g.dart';

abstract class Injector {
  @Register.singleton(UserService, from: TestUserService)
  void registerWebservices();

  @Register.singleton(UserRepository)
  @Register.singleton(DebugRepository)
  @Register.singleton(LocaleRepository)
  @Register.singleton(SharedPrefs, from: TestSharedPrefs)
  void registerCommonDependencies();

  @Register.factory(HomeViewModel)
  @Register.factory(SplashViewModel)
  @Register.factory(GlobalViewModel)
  @Register.factory(DebugViewModel)
  @Register.factory(DebugPlatformSelectorViewModel)
  void registerViewModelFactories();
}

Future<void> setupDependencyTree() async {
  _$Injector()
    ..registerWebservices()
    ..registerCommonDependencies()
    ..registerViewModelFactories();
}
