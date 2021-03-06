// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i13;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i15;
import 'package:flutter_template/database/flutter_template_database.dart'
    as _i17;
import 'package:flutter_template/database/todo/todo_dao_storing.dart' as _i44;
import 'package:flutter_template/navigator/main_navigation.dart' as _i30;
import 'package:flutter_template/repository/debug/debug_repo.dart' as _i9;
import 'package:flutter_template/repository/locale/locale_repo.dart' as _i24;
import 'package:flutter_template/repository/login/login_repo.dart' as _i26;
import 'package:flutter_template/repository/refresh/refresh_repo.dart' as _i32;
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart'
    as _i3;
import 'package:flutter_template/repository/secure_storage/secure_storing.dart'
    as _i34;
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart'
    as _i22;
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart'
    as _i38;
import 'package:flutter_template/repository/todo/todo_repo.dart' as _i48;
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart'
    as _i5;
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i7;
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart' as _i11;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart'
    as _i18;
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart'
    as _i20;
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart' as _i28;
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart'
    as _i40;
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart'
    as _i42;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i46;
import 'package:flutter_template/webservice/todo/todo_service.dart' as _i50;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i36;

import '../mocks/database/todo/mock_todo_dao_storage.dart' as _i45;
import '../mocks/main_navigator/mock_main_navigator_widget.dart' as _i31;
import '../mocks/mock_flutter_secure_storage.dart' as _i16;
import '../mocks/mock_shared_preferences.dart' as _i37;
import '../mocks/repository/debug/mock_debug_repository.dart' as _i10;
import '../mocks/repository/locale/mock_locale_repository.dart' as _i25;
import '../mocks/repository/login/mock_login_repository.dart' as _i27;
import '../mocks/repository/refresh/mock_refresh_repository.dart' as _i33;
import '../mocks/repository/secure_storage/auth/mock_auth_storage.dart' as _i4;
import '../mocks/repository/secure_storage/mock_secure_storage.dart' as _i35;
import '../mocks/repository/shared_prefs/local/mock_local_storage.dart' as _i23;
import '../mocks/repository/shared_prefs/mock_shared_prefs_storage.dart'
    as _i39;
import '../mocks/repository/todo/mock_todo_repository.dart' as _i49;
import '../mocks/util/mock_connectivity_controller.dart' as _i6;
import '../mocks/viewmodel/debug/mock_debug_platform_selector_viewmodel.dart'
    as _i8;
import '../mocks/viewmodel/debug/mock_debug_viewmodel.dart' as _i12;
import '../mocks/viewmodel/global/mock_global_viewmodel.dart' as _i19;
import '../mocks/viewmodel/license/mock_lisence_viewmodel.dart' as _i21;
import '../mocks/viewmodel/login/mock_login_viewmodel.dart' as _i29;
import '../mocks/viewmodel/splash/mock_splash_viewmodel.dart' as _i41;
import '../mocks/viewmodel/todo/todo_add/mock_todo_add_viewmodel.dart' as _i43;
import '../mocks/viewmodel/todo/todo_list/mock_todo_list_viewmodel.dart'
    as _i47;
import '../mocks/webservice/mock_dio.dart' as _i14;
import '../mocks/webservice/todo/mock_todo_service.dart' as _i51;
import 'test_injectable.dart' as _i52;

const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initTestGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AuthStoring>(_i4.MockAuthStorage(), registerFor: {_test});
  gh.singleton<_i5.ConnectivityControlling>(_i6.MockConnectivityController(),
      registerFor: {_test});
  gh.singleton<_i7.DebugPlatformSelectorViewModel>(
      _i8.MockDebugPlatformSelectorViewModel(),
      registerFor: {_test});
  gh.singleton<_i9.DebugRepo>(_i10.MockDebugRepository(), registerFor: {_test});
  gh.singleton<_i11.DebugViewModel>(_i12.MockDebugViewModel(),
      registerFor: {_test});
  gh.singleton<_i13.Dio>(_i14.MockDio(), registerFor: {_test});
  gh.singleton<_i15.FlutterSecureStorage>(_i16.MockFlutterSecureStorage(),
      registerFor: {_test});
  gh.singleton<_i17.FlutterTemplateDatabase>(
      registerModule.flutterTemplateDatabase,
      registerFor: {_test});
  gh.singleton<_i18.GlobalViewModel>(_i19.MockGlobalViewModel(),
      registerFor: {_test});
  gh.singleton<_i20.LicenseViewModel>(_i21.MockLicenseViewModel(),
      registerFor: {_test});
  gh.singleton<_i22.LocalStoring>(_i23.MockLocalStorage(),
      registerFor: {_test});
  gh.singleton<_i24.LocaleRepo>(_i25.MockLocaleRepoitory(),
      registerFor: {_test});
  gh.singleton<_i26.LoginRepo>(_i27.MockLoginRepository(),
      registerFor: {_test});
  gh.singleton<_i28.LoginViewModel>(_i29.MockLoginViewModel(),
      registerFor: {_test});
  gh.singleton<_i30.MainNavigation>(_i31.MockMainNavigation(),
      registerFor: {_test});
  gh.singleton<_i32.RefreshRepo>(_i33.MockRefreshRepository(),
      registerFor: {_test});
  gh.singleton<_i34.SecureStoring>(_i35.MockSecureStorage(),
      registerFor: {_test});
  gh.singleton<_i36.SharedPreferences>(_i37.MockSharedPreferences(),
      registerFor: {_test});
  gh.singleton<_i38.SharedPrefsStoring>(_i39.MockSharedPrefsStorage(),
      registerFor: {_test});
  gh.singleton<_i40.SplashViewModel>(_i41.MockSplashViewModel(),
      registerFor: {_test});
  gh.singleton<_i42.TodoAddViewModel>(_i43.MockTodoAddViewModel(),
      registerFor: {_test});
  gh.singleton<_i44.TodoDaoStoring>(_i45.MockTodoDaoStorage(),
      registerFor: {_test});
  gh.singleton<_i46.TodoListViewModel>(_i47.MockTodoListViewModel(),
      registerFor: {_test});
  gh.singleton<_i48.TodoRepo>(_i49.MockTodoRepository(), registerFor: {_test});
  gh.singleton<_i50.TodoService>(_i51.MockTodoService(), registerFor: {_test});
  return get;
}

class _$RegisterModule extends _i52.RegisterModule {}
