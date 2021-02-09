// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/navigator/main_navigation.dart';
import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';

import '../mocks/repository/secure_storage/auth/mock_auth_storage.dart';
import '../mocks/util/mock_connectivity_controller.dart';
import '../mocks/viewmodel/debug/mock_debug_platform_selector_viewmodel.dart';
import '../mocks/repository/debug/mock_debug_repository.dart';
import '../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
import '../mocks/webservice/mock_dio.dart';
import '../mocks/mock_flutter_secure_storage.dart';
import '../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../mocks/viewmodel/license/mock_lisence_viewmodel.dart';
import '../mocks/repository/shared_prefs/local/mock_local_storage.dart';
import '../mocks/repository/locale/mock_locale_repository.dart';
import '../mocks/repository/login/mock_login_repository.dart';
import '../mocks/viewmodel/login/mock_login_viewmodel.dart';
import '../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../mocks/repository/refresh/mock_refresh_repository.dart';
import '../mocks/repository/secure_storage/mock_secure_storage.dart';
import '../mocks/mock_shared_preferences.dart';
import '../mocks/repository/shared_prefs/mock_shared_prefs_storage.dart';
import '../mocks/viewmodel/splash/mock_splash_viewmodel.dart';
import '../mocks/viewmodel/todo/todo_add/mock_todo_add_viewmodel.dart';
import '../mocks/database/todo/mock_todo_dao_storage.dart';
import '../mocks/viewmodel/todo/todo_list/mock_todo_list_viewmodel.dart';
import '../mocks/repository/todo/mock_todo_repository.dart';
import '../mocks/webservice/todo/mock_todo_service.dart';
import 'test_injectable.dart';

/// Environment names
const _test = 'test';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initTestGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();

  // Eager singletons must be registered in the right order
  gh.singleton<AuthStoring>(MockAuthStorage(), registerFor: {_test});
  gh.singleton<ConnectivityControlling>(MockConnectivityController(),
      registerFor: {_test});
  gh.singleton<DebugPlatformSelectorViewModel>(
      MockDebugPlatformSelectorViewModel(),
      registerFor: {_test});
  gh.singleton<DebugRepo>(MockDebugRepository(), registerFor: {_test});
  gh.singleton<DebugViewModel>(MockDebugViewModel(), registerFor: {_test});
  gh.singleton<Dio>(MockDio(), registerFor: {_test});
  gh.singleton<FlutterSecureStorage>(MockFlutterSecureStorage(),
      registerFor: {_test});
  gh.singleton<FlutterTemplateDatabase>(registerModule.flutterTemplateDatabase,
      registerFor: {_test});
  gh.singleton<GlobalViewModel>(MockGlobalViewModel(), registerFor: {_test});
  gh.singleton<LicenseViewModel>(MockLicenseViewModel(), registerFor: {_test});
  gh.singleton<LocalStoring>(MockLocalStorage(), registerFor: {_test});
  gh.singleton<LocaleRepo>(MockLocaleRepoitory(), registerFor: {_test});
  gh.singleton<LoginRepo>(MockLoginRepository(), registerFor: {_test});
  gh.singleton<LoginViewModel>(MockLoginViewModel(), registerFor: {_test});
  gh.singleton<MainNavigation>(MockMainNavigation(), registerFor: {_test});
  gh.singleton<RefreshRepo>(MockRefreshRepository(), registerFor: {_test});
  gh.singleton<SecureStoring>(MockSecureStorage(), registerFor: {_test});
  gh.singleton<SharedPreferences>(MockSharedPreferences(),
      registerFor: {_test});
  gh.singleton<SharedPrefsStoring>(MockSharedPrefsStorage(),
      registerFor: {_test});
  gh.singleton<SplashViewModel>(MockSplashViewModel(), registerFor: {_test});
  gh.singleton<TodoAddViewModel>(MockTodoAddViewModel(), registerFor: {_test});
  gh.singleton<TodoDaoStoring>(MockTodoDaoStorage(), registerFor: {_test});
  gh.singleton<TodoListViewModel>(MockTodoListViewModel(),
      registerFor: {_test});
  gh.singleton<TodoRepo>(MockTodoRepository(), registerFor: {_test});
  gh.singleton<TodoService>(MockTodoService(), registerFor: {_test});
  return get;
}

class _$RegisterModule extends RegisterModule {}
