import 'package:flutter_template/repository/debug_repository.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:kiwi/kiwi.dart';

part 'test_injector.g.dart';

abstract class Injector {

  @Register.singleton(TodoRepository)
  @Register.singleton(DebugRepository)
  @Register.singleton(LocaleRepository)
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
    ..registerCommonDependencies()
    ..registerViewModelFactories();
}
