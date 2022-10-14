// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i40;
import 'package:drift/drift.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../database/flutter_template_database.dart' as _i11;
import '../database/todo/todo_dao_storage.dart' as _i19;
import '../navigator/main_navigator.dart' as _i14;
import '../repository/analytics/firebase_analytics_repository.dart' as _i23;
import '../repository/debug/debug_repository.dart' as _i27;
import '../repository/locale/locale_repository.dart' as _i30;
import '../repository/login/login_repository.dart' as _i31;
import '../repository/refresh/refresh_repository.dart' as _i34;
import '../repository/secure_storage/auth/auth_storage.dart' as _i26;
import '../repository/secure_storage/secure_storage.dart' as _i17;
import '../repository/shared_prefs/local/local_storage.dart' as _i29;
import '../repository/todo/todo_repository.dart' as _i25;
import '../styles/theme_data.dart' as _i12;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../util/interceptor/network_auth_interceptor.dart' as _i33;
import '../util/interceptor/network_error_interceptor.dart' as _i15;
import '../util/interceptor/network_log_interceptor.dart' as _i16;
import '../util/interceptor/network_refresh_interceptor.dart' as _i39;
import '../util/locale/localization.dart' as _i13;
import '../util/snackbar/error_util.dart' as _i8;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i22;
import '../viewmodel/debug/debug_viewmodel.dart' as _i28;
import '../viewmodel/global/global_viewmodel.dart' as _i38;
import '../viewmodel/license/license_viewmodel.dart' as _i24;
import '../viewmodel/login/login_viewmodel.dart' as _i32;
import '../viewmodel/splash/splash_viewmodel.dart' as _i35;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i36;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i37;
import '../webservice/todo/todo_dummy_service.dart' as _i21;
import '../webservice/todo/todo_service.dart' as _i20;
import '../webservice/todo/todo_webservice.dart' as _i41;
import 'injectable.dart' as _i42;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Brightness>(() => registerModule.brightness());
  gh.singleton<_i4.CacheControlling>(_i5.CacheController());
  gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i7.DatabaseConnection>(
    () => registerModule.provideDatabaseConnection(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.ErrorUtil>(() => _i8.ErrorUtil());
  gh.lazySingleton<_i9.FirebaseAnalytics>(
      () => registerModule.provideFirebaseAnalytics());
  gh.lazySingleton<_i10.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i11.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i7.DatabaseConnection>()));
  gh.lazySingleton<_i12.FlutterTemplateTheme>(() => registerModule.theme());
  gh.lazySingleton<_i13.Localization>(() => registerModule.localization());
  gh.lazySingleton<_i14.MainNavigator>(
      () => _i14.MainNavigator(get<_i8.ErrorUtil>()));
  gh.singleton<_i15.NetworkErrorInterceptor>(
      _i15.NetworkErrorInterceptor(get<_i6.ConnectivityHelper>()));
  gh.singleton<_i16.NetworkLogInterceptor>(_i16.NetworkLogInterceptor());
  gh.lazySingleton<_i17.SecureStorage>(
      () => _i17.SecureStorage(get<_i10.FlutterSecureStorage>()));
  await gh.singletonAsync<_i18.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i19.TodoDaoStorage>(
      () => _i19.TodoDaoStorage(get<_i11.FlutterTemplateDatabase>()));
  gh.singleton<_i20.TodoService>(
    _i21.TodoDummyService(),
    registerFor: {_dummy},
  );
  gh.factory<_i22.DebugPlatformSelectorViewModel>(
      () => _i22.DebugPlatformSelectorViewModel(get<_i14.MainNavigator>()));
  gh.lazySingleton<_i23.FireBaseAnalyticsRepository>(
      () => _i23.FireBaseAnalyticsRepository(get<_i9.FirebaseAnalytics>()));
  gh.factory<_i24.LicenseViewModel>(
      () => _i24.LicenseViewModel(get<_i14.MainNavigator>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i18.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i6.SharedPreferenceStorage>(),
            get<_i17.SecureStorage>(),
          ));
  gh.lazySingleton<_i25.TodoRepository>(() => _i25.TodoRepository(
        get<_i20.TodoService>(),
        get<_i19.TodoDaoStorage>(),
      ));
  gh.lazySingleton<_i26.AuthStorage>(
      () => _i26.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i27.DebugRepository>(
      () => _i27.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.factory<_i28.DebugViewModel>(() => _i28.DebugViewModel(
        get<_i27.DebugRepository>(),
        get<_i14.MainNavigator>(),
        get<_i11.FlutterTemplateDatabase>(),
      ));
  gh.lazySingleton<_i29.LocalStorage>(() => _i29.LocalStorage(
        get<_i26.AuthStorage>(),
        get<_i6.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i30.LocaleRepository>(
      () => _i30.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i31.LoginRepository>(
      () => _i31.LoginRepository(get<_i26.AuthStorage>()));
  gh.factory<_i32.LoginViewModel>(() => _i32.LoginViewModel(
        get<_i31.LoginRepository>(),
        get<_i14.MainNavigator>(),
      ));
  gh.singleton<_i33.NetworkAuthInterceptor>(
      _i33.NetworkAuthInterceptor(get<_i26.AuthStorage>()));
  gh.lazySingleton<_i34.RefreshRepository>(
      () => _i34.RefreshRepository(get<_i26.AuthStorage>()));
  gh.factory<_i35.SplashViewModel>(() => _i35.SplashViewModel(
        get<_i31.LoginRepository>(),
        get<_i29.LocalStorage>(),
        get<_i14.MainNavigator>(),
      ));
  gh.factory<_i36.TodoAddViewModel>(() => _i36.TodoAddViewModel(
        get<_i25.TodoRepository>(),
        get<_i14.MainNavigator>(),
      ));
  gh.factory<_i37.TodoListViewModel>(() => _i37.TodoListViewModel(
        get<_i25.TodoRepository>(),
        get<_i14.MainNavigator>(),
      ));
  gh.lazySingleton<_i38.GlobalViewModel>(() => _i38.GlobalViewModel(
        get<_i30.LocaleRepository>(),
        get<_i27.DebugRepository>(),
        get<_i29.LocalStorage>(),
        get<_i13.Localization>(),
      ));
  gh.singleton<_i39.NetworkRefreshInterceptor>(_i39.NetworkRefreshInterceptor(
    get<_i26.AuthStorage>(),
    get<_i34.RefreshRepository>(),
  ));
  gh.lazySingleton<_i6.CombiningSmartInterceptor>(
      () => registerModule.provideCombiningSmartInterceptor(
            get<_i16.NetworkLogInterceptor>(),
            get<_i33.NetworkAuthInterceptor>(),
            get<_i15.NetworkErrorInterceptor>(),
            get<_i39.NetworkRefreshInterceptor>(),
          ));
  gh.lazySingleton<_i40.Dio>(
      () => registerModule.provideDio(get<_i6.CombiningSmartInterceptor>()));
  gh.singleton<_i20.TodoService>(
    _i41.TodoWebService(get<_i40.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return get;
}

class _$RegisterModule extends _i42.RegisterModule {}
