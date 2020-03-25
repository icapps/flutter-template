import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/repository/debug_repository.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_template/repository/login/todo_repo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:kiwi/kiwi.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../mocks/database/todo/mock_todo_dao_storage.dart';
import '../mocks/repository/login/mock_login_repository.dart';
import '../mocks/repository/todo/mock_todo_repository.dart';
import '../mocks/webservice/mock_todo_service.dart';

part 'test_injector.g.dart';

abstract class Injector {
  @Register.singleton(FlutterTemplateDatabase)
  @Register.singleton(TodoDaoStoring, from: MockTodoDaoStorage)
  void registerDatabase();

  @Register.singleton(LoginRepo, from: MockLoginRepository)
  @Register.singleton(TodoRepo, from: MockTodoRepository)
  void registerRepositories();

  @Register.singleton(TodoService, from: MockTodoService)
  void registerMockServices();

  @Register.factory(GlobalViewModel)
  @Register.factory(SplashViewModel)
  @Register.factory(HomeViewModel)
  @Register.factory(DebugViewModel)
  @Register.factory(DebugPlatformSelectorViewModel)
  @Register.factory(LicenseViewModel)
  @Register.factory(TodoListViewModel)
  @Register.factory(TodoAddViewModel)
  @Register.factory(LoginViewModel)
  void registerViewModelFactories();
}

Future<void> setupDependencyTree() async {
  Container().registerSingleton<QueryExecutor, LazyDatabase>((c) => VmDatabase.memory());

  _$Injector().registerMockServices();

  _$Injector()
    ..registerDatabase()
    ..registerRepositories()
    ..registerViewModelFactories();
}
