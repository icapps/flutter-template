// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i41;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:flutter_template/database/flutter_template_database.dart'
    as _i10;
import 'package:flutter_template/database/todo/todo_dao_storage.dart' as _i18;
import 'package:flutter_template/di/injectable.dart' as _i43;
import 'package:flutter_template/navigator/main_navigator.dart' as _i13;
import 'package:flutter_template/repository/analytics/firebase_analytics_repository.dart'
    as _i22;
import 'package:flutter_template/repository/debug/debug_repository.dart'
    as _i26;
import 'package:flutter_template/repository/locale/locale_repository.dart'
    as _i28;
import 'package:flutter_template/repository/login/login_repository.dart'
    as _i29;
import 'package:flutter_template/repository/refresh/refresh_repository.dart'
    as _i32;
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart'
    as _i25;
import 'package:flutter_template/repository/secure_storage/secure_storage.dart'
    as _i16;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i27;
import 'package:flutter_template/repository/todo/todo_repository.dart' as _i24;
import 'package:flutter_template/styles/theme_data.dart' as _i11;
import 'package:flutter_template/util/cache/cache_controller.dart' as _i4;
import 'package:flutter_template/util/cache/cache_controlling.dart' as _i3;
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart'
    as _i31;
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart'
    as _i14;
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart'
    as _i15;
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart'
    as _i40;
import 'package:flutter_template/util/locale/localization.dart' as _i12;
import 'package:flutter_template/util/snackbar/error_util.dart' as _i7;
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i21;
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i37;
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart' as _i38;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart'
    as _i39;
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart'
    as _i23;
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart' as _i30;
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i36;
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart'
    as _i33;
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart'
    as _i34;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i35;
import 'package:flutter_template/webservice/todo/todo_dummy_service.dart'
    as _i20;
import 'package:flutter_template/webservice/todo/todo_service.dart' as _i19;
import 'package:flutter_template/webservice/todo/todo_webservice.dart' as _i42;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.CacheControlling>(_i4.CacheController());
    gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
    await gh.singletonAsync<_i6.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true,
    );
    gh.lazySingleton<_i7.ErrorUtil>(() => _i7.ErrorUtil());
    gh.lazySingleton<_i8.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i10.FlutterTemplateDatabase>(() => registerModule
        .provideFlutterTemplateDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i11.FlutterTemplateTheme>(() => registerModule.theme());
    gh.lazySingleton<_i12.Localization>(() => registerModule.localization());
    gh.lazySingleton<_i13.MainNavigator>(
        () => _i13.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i14.NetworkErrorInterceptor>(
        _i14.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i15.NetworkLogInterceptor>(_i15.NetworkLogInterceptor());
    gh.lazySingleton<_i16.SecureStorage>(
        () => _i16.SecureStorage(gh<_i9.FlutterSecureStorage>()));
    await gh.singletonAsync<_i17.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i18.TodoDaoStorage>(
        () => _i18.TodoDaoStorage(gh<_i10.FlutterTemplateDatabase>()));
    gh.singleton<_i19.TodoService>(
      _i20.TodoDummyService(),
      registerFor: {_dummy},
    );
    gh.factory<_i21.DebugPlatformSelectorViewModel>(
        () => _i21.DebugPlatformSelectorViewModel(gh<_i13.MainNavigator>()));
    gh.lazySingleton<_i22.FireBaseAnalyticsRepository>(
        () => _i22.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.factory<_i23.LicenseViewModel>(
        () => _i23.LicenseViewModel(gh<_i13.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i17.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i16.SecureStorage>(),
            ));
    gh.lazySingleton<_i24.TodoRepository>(() => _i24.TodoRepository(
          gh<_i19.TodoService>(),
          gh<_i18.TodoDaoStorage>(),
        ));
    gh.lazySingleton<_i25.AuthStorage>(
        () => _i25.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i26.DebugRepository>(
        () => _i26.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i27.LocalStorage>(() => _i27.LocalStorage(
          gh<_i25.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i28.LocaleRepository>(
        () => _i28.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i29.LoginRepository>(
        () => _i29.LoginRepository(gh<_i25.AuthStorage>()));
    gh.factory<_i30.LoginViewModel>(() => _i30.LoginViewModel(
          gh<_i29.LoginRepository>(),
          gh<_i13.MainNavigator>(),
        ));
    gh.singleton<_i31.NetworkAuthInterceptor>(
        _i31.NetworkAuthInterceptor(gh<_i25.AuthStorage>()));
    gh.lazySingleton<_i32.RefreshRepository>(
        () => _i32.RefreshRepository(gh<_i25.AuthStorage>()));
    gh.factory<_i33.SplashViewModel>(() => _i33.SplashViewModel(
          gh<_i29.LoginRepository>(),
          gh<_i27.LocalStorage>(),
          gh<_i13.MainNavigator>(),
        ));
    gh.factory<_i34.TodoAddViewModel>(() => _i34.TodoAddViewModel(
          gh<_i24.TodoRepository>(),
          gh<_i13.MainNavigator>(),
        ));
    gh.factory<_i35.TodoListViewModel>(() => _i35.TodoListViewModel(
          gh<_i24.TodoRepository>(),
          gh<_i13.MainNavigator>(),
        ));
    gh.factory<_i36.AnalyticsPermissionViewModel>(
        () => _i36.AnalyticsPermissionViewModel(
              gh<_i13.MainNavigator>(),
              gh<_i27.LocalStorage>(),
            ));
    gh.factory<_i37.DebugThemeSelectorViewmodel>(
        () => _i37.DebugThemeSelectorViewmodel(
              gh<_i13.MainNavigator>(),
              gh<_i27.LocalStorage>(),
            ));
    gh.factory<_i38.DebugViewModel>(() => _i38.DebugViewModel(
          gh<_i26.DebugRepository>(),
          gh<_i13.MainNavigator>(),
          gh<_i10.FlutterTemplateDatabase>(),
          gh<_i27.LocalStorage>(),
        ));
    gh.lazySingleton<_i39.GlobalViewModel>(() => _i39.GlobalViewModel(
          gh<_i28.LocaleRepository>(),
          gh<_i26.DebugRepository>(),
          gh<_i27.LocalStorage>(),
          gh<_i12.Localization>(),
        ));
    gh.singleton<_i40.NetworkRefreshInterceptor>(_i40.NetworkRefreshInterceptor(
      gh<_i25.AuthStorage>(),
      gh<_i32.RefreshRepository>(),
    ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i15.NetworkLogInterceptor>(),
              gh<_i31.NetworkAuthInterceptor>(),
              gh<_i14.NetworkErrorInterceptor>(),
              gh<_i40.NetworkRefreshInterceptor>(),
            ));
    gh.lazySingleton<_i41.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    gh.singleton<_i19.TodoService>(
      _i42.TodoWebService(gh<_i41.Dio>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$RegisterModule extends _i43.RegisterModule {}
