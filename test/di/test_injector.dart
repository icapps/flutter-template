import 'package:dio/dio.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/cubit/license/license_cubit.dart';
import 'package:flutter_template/cubit/login/login_cubit.dart';
import 'package:flutter_template/cubit/splash/splash_cubit.dart';
import 'package:flutter_template/cubit/todoAdd/todo_add_cubit.dart';
import 'package:flutter_template/cubit/todoList/todo_list_cubit.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:kiwi/kiwi.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../mocks/bloc/mock_blocs.dart';
import '../mocks/database/todo/mock_todo_dao_storage.dart';
import '../mocks/mock_flutter_secure_storage.dart';
import '../mocks/mock_shared_preferences.dart';
import '../mocks/repository/debug/mock_debug_repository.dart';
import '../mocks/repository/locale/mock_locale_repository.dart';
import '../mocks/repository/login/mock_login_repository.dart';
import '../mocks/repository/refresh/mock_refresh_repository.dart';
import '../mocks/repository/secure_storage/auth/mock_auth_storage.dart';
import '../mocks/repository/secure_storage/mock_secure_storage.dart';
import '../mocks/repository/shared_prefs/local/mock_local_storage.dart';
import '../mocks/repository/shared_prefs/mock_shared_prefs_storage.dart';
import '../mocks/repository/todo/mock_todo_repository.dart';
import '../mocks/util/mock_connectivity_controller.dart';
import '../mocks/webservice/mock_dio.dart';
import '../mocks/webservice/mock_todo_service.dart';

part 'test_injector.g.dart';

abstract class Injector {
  @Register.singleton(MockFlutterSecureStorage)
  @Register.singleton(MockSharedPreferences)
  @Register.singleton(Dio, from: MockDio)
  void registerMocks();

  @Register.singleton(FlutterTemplateDatabase)
  @Register.singleton(TodoDaoStoring, from: MockTodoDaoStorage)
  void registerDatabase();

  @Register.singleton(LoginRepo, from: MockLoginRepository)
  @Register.singleton(TodoRepo, from: MockTodoRepository)
  @Register.singleton(DebugRepo, from: MockDebugRepository)
  @Register.singleton(LocaleRepo, from: MockLocaleRepository)
  @Register.singleton(RefreshRepo, from: MockRefreshRepository)
  void registerRepositories();

  @Register.singleton(SharedPrefsStoring, from: MockSharedPrefsStorage)
  @Register.singleton(SecureStoring, from: MockSecureStorage)
  @Register.singleton(AuthStoring, from: MockAuthStorage)
  @Register.singleton(LocalStoring, from: MockLocalStorage)
  @Register.singleton(ConnectivityControlling, from: MockConnectivityController)
  void registerCommonDependencies();

  @Register.singleton(TodoService, from: MockTodoService)
  void registerMockServices();

  @Register.singleton(GlobalCubit, from: MockGlobalCubit)
  @Register.singleton(LicenseCubit, from: MockLicenseCubit)
  @Register.singleton(LoginCubit, from: MockLoginCubit)
  @Register.singleton(SplashCubit, from: MockSplashCubit)
  @Register.singleton(TodoAddCubit, from: MockTodoAddCubit)
  @Register.singleton(TodoListCubit, from: MockTodoListCubit)
  void registerBlocs();
}

Future<void> setupDependencyTree() async {
  KiwiContainer().registerSingleton<QueryExecutor>((c) => VmDatabase.memory());

  _$Injector()
    ..registerMocks()
    ..registerMockServices()
    ..registerDatabase()
    ..registerCommonDependencies()
    ..registerRepositories()
    ..registerBlocs();
}
