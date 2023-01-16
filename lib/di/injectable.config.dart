// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i39;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:flutter_template/database/flutter_template_database.dart'
    as _i10;
import 'package:flutter_template/database/todo/todo_dao_storage.dart' as _i16;
import 'package:flutter_template/di/injectable.dart' as _i41;
import 'package:flutter_template/navigator/main_navigator.dart' as _i11;
import 'package:flutter_template/repository/analytics/firebase_analytics_repository.dart'
    as _i20;
import 'package:flutter_template/repository/debug/debug_repository.dart'
    as _i24;
import 'package:flutter_template/repository/locale/locale_repository.dart'
    as _i26;
import 'package:flutter_template/repository/login/login_repository.dart'
    as _i27;
import 'package:flutter_template/repository/refresh/refresh_repository.dart'
    as _i30;
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart'
    as _i23;
import 'package:flutter_template/repository/secure_storage/secure_storage.dart'
    as _i14;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i25;
import 'package:flutter_template/repository/todo/todo_repository.dart' as _i22;
import 'package:flutter_template/util/cache/cache_controller.dart' as _i4;
import 'package:flutter_template/util/cache/cache_controlling.dart' as _i3;
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart'
    as _i29;
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart'
    as _i12;
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart'
    as _i13;
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart'
    as _i37;
import 'package:flutter_template/util/snackbar/error_util.dart' as _i7;
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i19;
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i38;
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart' as _i35;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart'
    as _i36;
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart'
    as _i21;
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart' as _i28;
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i34;
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart'
    as _i31;
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart'
    as _i32;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i33;
import 'package:flutter_template/webservice/todo/todo_dummy_service.dart'
    as _i18;
import 'package:flutter_template/webservice/todo/todo_service.dart' as _i17;
import 'package:flutter_template/webservice/todo/todo_webservice.dart' as _i40;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> initGetIt({
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
    gh.lazySingleton<_i11.MainNavigator>(
        () => _i11.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i12.NetworkErrorInterceptor>(
        _i12.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i13.NetworkLogInterceptor>(_i13.NetworkLogInterceptor());
    gh.lazySingleton<_i14.SecureStorage>(
        () => _i14.SecureStorage(gh<_i9.FlutterSecureStorage>()));
    await gh.singletonAsync<_i15.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i16.TodoDaoStorage>(
        () => _i16.TodoDaoStorage(gh<_i10.FlutterTemplateDatabase>()));
    gh.singleton<_i17.TodoService>(
      _i18.TodoDummyService(),
      registerFor: {_dummy},
    );
    gh.factory<_i19.DebugPlatformSelectorViewModel>(
        () => _i19.DebugPlatformSelectorViewModel(gh<_i11.MainNavigator>()));
    gh.lazySingleton<_i20.FireBaseAnalyticsRepository>(
        () => _i20.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.factory<_i21.LicenseViewModel>(
        () => _i21.LicenseViewModel(gh<_i11.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i15.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i14.SecureStorage>(),
            ));
    gh.lazySingleton<_i22.TodoRepository>(() => _i22.TodoRepository(
          gh<_i17.TodoService>(),
          gh<_i16.TodoDaoStorage>(),
        ));
    gh.lazySingleton<_i23.AuthStorage>(
        () => _i23.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i24.DebugRepository>(
        () => _i24.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i25.LocalStorage>(() => _i25.LocalStorage(
          gh<_i23.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i26.LocaleRepository>(
        () => _i26.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i27.LoginRepository>(
        () => _i27.LoginRepository(gh<_i23.AuthStorage>()));
    gh.factory<_i28.LoginViewModel>(() => _i28.LoginViewModel(
          gh<_i27.LoginRepository>(),
          gh<_i11.MainNavigator>(),
        ));
    gh.singleton<_i29.NetworkAuthInterceptor>(
        _i29.NetworkAuthInterceptor(gh<_i23.AuthStorage>()));
    gh.lazySingleton<_i30.RefreshRepository>(
        () => _i30.RefreshRepository(gh<_i23.AuthStorage>()));
    gh.factory<_i31.SplashViewModel>(() => _i31.SplashViewModel(
          gh<_i27.LoginRepository>(),
          gh<_i25.LocalStorage>(),
          gh<_i11.MainNavigator>(),
        ));
    gh.factory<_i32.TodoAddViewModel>(() => _i32.TodoAddViewModel(
          gh<_i22.TodoRepository>(),
          gh<_i11.MainNavigator>(),
        ));
    gh.factory<_i33.TodoListViewModel>(() => _i33.TodoListViewModel(
          gh<_i22.TodoRepository>(),
          gh<_i11.MainNavigator>(),
        ));
    gh.factory<_i34.AnalyticsPermissionViewModel>(
        () => _i34.AnalyticsPermissionViewModel(
              gh<_i11.MainNavigator>(),
              gh<_i25.LocalStorage>(),
            ));
    gh.factory<_i35.DebugViewModel>(() => _i35.DebugViewModel(
          gh<_i24.DebugRepository>(),
          gh<_i11.MainNavigator>(),
          gh<_i10.FlutterTemplateDatabase>(),
          gh<_i25.LocalStorage>(),
        ));
    gh.lazySingleton<_i36.GlobalViewModel>(() => _i36.GlobalViewModel(
          gh<_i26.LocaleRepository>(),
          gh<_i24.DebugRepository>(),
          gh<_i25.LocalStorage>(),
        ));
    gh.singleton<_i37.NetworkRefreshInterceptor>(_i37.NetworkRefreshInterceptor(
      gh<_i23.AuthStorage>(),
      gh<_i30.RefreshRepository>(),
    ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i13.NetworkLogInterceptor>(),
              gh<_i29.NetworkAuthInterceptor>(),
              gh<_i12.NetworkErrorInterceptor>(),
              gh<_i37.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i38.DebugThemeSelectorViewModel>(
        () => _i38.DebugThemeSelectorViewModel(
              gh<_i11.MainNavigator>(),
              gh<_i36.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i39.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    gh.singleton<_i17.TodoService>(
      _i40.TodoWebService(gh<_i39.Dio>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$RegisterModule extends _i41.RegisterModule {}
