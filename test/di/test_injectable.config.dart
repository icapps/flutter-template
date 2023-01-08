// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:firebase_analytics/firebase_analytics.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:flutter_template/database/flutter_template_database.dart'
    as _i12;
import 'package:flutter_template/database/todo/todo_dao_storage.dart' as _i26;
import 'package:flutter_template/navigator/main_navigator.dart' as _i20;
import 'package:flutter_template/repository/debug/debug_repository.dart' as _i7;
import 'package:flutter_template/repository/locale/locale_repository.dart'
    as _i16;
import 'package:flutter_template/repository/login/login_repository.dart'
    as _i18;
import 'package:flutter_template/repository/refresh/refresh_repository.dart'
    as _i21;
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart'
    as _i4;
import 'package:flutter_template/repository/secure_storage/secure_storage.dart'
    as _i22;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i15;
import 'package:flutter_template/repository/todo/todo_repository.dart' as _i28;
import 'package:flutter_template/util/locale/localization.dart' as _i17;
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i6;
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart' as _i8;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart'
    as _i13;
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart'
    as _i14;
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart' as _i19;
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i3;
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart'
    as _i24;
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart'
    as _i25;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i27;
import 'package:flutter_template/webservice/todo/todo_service.dart' as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '/flutter_template/test/di/test_injectable.dart' as _i30;

const String _test = 'test';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt $initTestGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AnalyticsPermissionViewModel>(
        registerModule.getAnalyticsPermissionViewModel);
    gh.singleton<_i4.AuthStorage>(registerModule.getAuthStoring);
    gh.singleton<_i5.ConnectivityHelper>(
        registerModule.getConnectivityControlling);
    gh.singleton<_i6.DebugPlatformSelectorViewModel>(
        registerModule.getDebugPlatformSelectorViewModel);
    gh.singleton<_i7.DebugRepository>(registerModule.getDebugRepo);
    gh.singleton<_i8.DebugViewModel>(registerModule.getDebugViewModel);
    gh.singleton<_i9.Dio>(registerModule.getDio);
    gh.singleton<_i10.FirebaseAnalytics>(registerModule.getFirebaseAnalytics);
    gh.singleton<_i11.FlutterSecureStorage>(
        registerModule.getFlutterSecureStorage);
    gh.singleton<_i12.FlutterTemplateDatabase>(
      registerModule.flutterTemplateDatabase,
      registerFor: {_test},
    );
    gh.singleton<_i13.GlobalViewModel>(registerModule.getGlobalViewModel);
    gh.singleton<_i14.LicenseViewModel>(registerModule.getLicenseViewModel);
    gh.singleton<_i15.LocalStorage>(registerModule.getLocalStoring);
    gh.singleton<_i16.LocaleRepository>(registerModule.getLocaleRepo);
    gh.singleton<_i17.Localization>(registerModule.getLocalization);
    gh.singleton<_i18.LoginRepository>(registerModule.getLoginRepo);
    gh.singleton<_i19.LoginViewModel>(registerModule.getLoginViewModel);
    gh.singleton<_i20.MainNavigator>(
      registerModule.getMainNavigator,
      registerFor: {_test},
    );
    gh.singleton<_i21.RefreshRepository>(registerModule.getRefreshRepo);
    gh.singleton<_i22.SecureStorage>(registerModule.getSecureStoring);
    gh.singleton<_i5.SharedPreferenceStorage>(
        registerModule.getSharedPrefsStoring);
    gh.singleton<_i23.SharedPreferences>(registerModule.getSharedPreferences);
    gh.singleton<_i24.SplashViewModel>(registerModule.getSplashViewModel);
    gh.singleton<_i25.TodoAddViewModel>(registerModule.getTodoAddViewModel);
    gh.singleton<_i26.TodoDaoStorage>(registerModule.getTodoDaoStoring);
    gh.singleton<_i27.TodoListViewModel>(registerModule.getTodoListViewModel);
    gh.singleton<_i28.TodoRepository>(registerModule.getTodoRepo);
    gh.singleton<_i29.TodoService>(registerModule.getTodoService);
    return this;
  }
}

class _$RegisterModule extends _i30.RegisterModule {}
