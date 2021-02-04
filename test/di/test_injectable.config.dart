// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../mocks/repository/secure_storage/auth/mock_auth_storage.dart';
import '../mocks/util/mock_connectivity_controller.dart';
import '../mocks/viewmodel/debug/mock_debug_platform_selector_viewmodel.dart';
import '../mocks/repository/debug/mock_debug_repository.dart';
import '../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
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
import '../mocks/database/todo/mock_todo_dao_storage.dart';
import '../mocks/repository/todo/mock_todo_repository.dart';
import '../mocks/webservice/todo/mock_todo_service.dart';

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
  gh.factory<MockAuthStorage>(() => MockAuthStorage(), registerFor: {_test});
  gh.factory<MockConnectivityController>(() => MockConnectivityController(),
      registerFor: {_test});
  gh.factory<MockDebugPlatformSelectorViewModel>(
      () => MockDebugPlatformSelectorViewModel(),
      registerFor: {_test});
  gh.factory<MockDebugRepository>(() => MockDebugRepository(),
      registerFor: {_test});
  gh.factory<MockDebugViewModel>(() => MockDebugViewModel(),
      registerFor: {_test});
  gh.factory<MockFlutterSecureStorage>(() => MockFlutterSecureStorage(),
      registerFor: {_test});
  gh.factory<MockGlobalViewModel>(() => MockGlobalViewModel(),
      registerFor: {_test});
  gh.factory<MockLicenseViewModel>(() => MockLicenseViewModel(),
      registerFor: {_test});
  gh.factory<MockLocalStorage>(() => MockLocalStorage(), registerFor: {_test});
  gh.factory<MockLocaleRepoitory>(() => MockLocaleRepoitory(),
      registerFor: {_test});
  gh.factory<MockLoginRepository>(() => MockLoginRepository(),
      registerFor: {_test});
  gh.factory<MockLoginViewModel>(() => MockLoginViewModel(),
      registerFor: {_test});
  gh.factory<MockMainNavigation>(() => MockMainNavigation(),
      registerFor: {_test});
  gh.factory<MockRefreshRepository>(() => MockRefreshRepository(),
      registerFor: {_test});
  gh.factory<MockSecureStorage>(() => MockSecureStorage(),
      registerFor: {_test});
  gh.factory<MockSharedPreferences>(() => MockSharedPreferences(),
      registerFor: {_test});
  gh.factory<MockSharedPrefsStorage>(() => MockSharedPrefsStorage(),
      registerFor: {_test});
  gh.factory<MockSplashViewModel>(() => MockSplashViewModel(),
      registerFor: {_test});
  gh.factory<MockTodoDaoStorage>(() => MockTodoDaoStorage(),
      registerFor: {_test});
  gh.factory<MockTodoRepository>(() => MockTodoRepository(),
      registerFor: {_test});
  gh.factory<MockTodoService>(() => MockTodoService(), registerFor: {_test});
  return get;
}
