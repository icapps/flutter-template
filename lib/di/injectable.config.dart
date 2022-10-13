// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i37;
import 'package:drift/drift.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../database/flutter_template_database.dart' as _i11;
import '../database/todo/todo_dao_storage.dart' as _i18;
import '../repository/analytics/firebase_analytics_repository.dart' as _i21;
import '../repository/debug/debug_repository.dart' as _i24;
import '../repository/locale/locale_repository.dart' as _i27;
import '../repository/login/login_repository.dart' as _i28;
import '../repository/refresh/refresh_repository.dart' as _i31;
import '../repository/secure_storage/auth/auth_storage.dart' as _i23;
import '../repository/secure_storage/secure_storage.dart' as _i16;
import '../repository/shared_prefs/local/local_storage.dart' as _i26;
import '../repository/todo/todo_repository.dart' as _i22;
import '../styles/theme_data.dart' as _i12;
import '../util/cache/cache_controller.dart' as _i5;
import '../util/cache/cache_controlling.dart' as _i4;
import '../util/interceptor/network_auth_interceptor.dart' as _i30;
import '../util/interceptor/network_error_interceptor.dart' as _i14;
import '../util/interceptor/network_log_interceptor.dart' as _i15;
import '../util/interceptor/network_refresh_interceptor.dart' as _i36;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i8;
import '../viewmodel/debug/debug_viewmodel.dart' as _i25;
import '../viewmodel/global/global_viewmodel.dart' as _i35;
import '../viewmodel/license/license_viewmodel.dart' as _i13;
import '../viewmodel/login/login_viewmodel.dart' as _i29;
import '../viewmodel/splash/splash_viewmodel.dart' as _i32;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i33;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i34;
import '../webservice/todo/todo_dummy_service.dart' as _i20;
import '../webservice/todo/todo_service.dart' as _i19;
import '../webservice/todo/todo_webservice.dart' as _i38;
import 'injectable.dart' as _i39;

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
  gh.factory<_i8.DebugPlatformSelectorViewModel>(
      () => _i8.DebugPlatformSelectorViewModel());
  gh.lazySingleton<_i9.FirebaseAnalytics>(
      () => registerModule.provideFirebaseAnalytics());
  gh.lazySingleton<_i10.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i11.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i7.DatabaseConnection>()));
  gh.lazySingleton<_i12.FlutterTemplateTheme>(() => registerModule.theme());
  gh.factory<_i13.LicenseViewModel>(() => _i13.LicenseViewModel());
  gh.singleton<_i14.NetworkErrorInterceptor>(
      _i14.NetworkErrorInterceptor(get<_i6.ConnectivityHelper>()));
  gh.singleton<_i15.NetworkLogInterceptor>(_i15.NetworkLogInterceptor());
  gh.lazySingleton<_i16.SecureStorage>(
      () => _i16.SecureStorage(get<_i10.FlutterSecureStorage>()));
  await gh.singletonAsync<_i17.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i18.TodoDaoStorage>(
      () => _i18.TodoDaoStorage(get<_i11.FlutterTemplateDatabase>()));
  gh.singleton<_i19.TodoService>(
    _i20.TodoDummyService(),
    registerFor: {_dummy},
  );
  gh.lazySingleton<_i21.FireBaseAnalyticsRepository>(
      () => _i21.FireBaseAnalyticsRepository(get<_i9.FirebaseAnalytics>()));
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i17.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i6.SharedPreferenceStorage>(),
            get<_i16.SecureStorage>(),
          ));
  gh.lazySingleton<_i22.TodoRepository>(() => _i22.TodoRepository(
        get<_i19.TodoService>(),
        get<_i18.TodoDaoStorage>(),
      ));
  gh.lazySingleton<_i23.AuthStorage>(
      () => _i23.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i24.DebugRepository>(
      () => _i24.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.factory<_i25.DebugViewModel>(
      () => _i25.DebugViewModel(get<_i24.DebugRepository>()));
  gh.lazySingleton<_i26.LocalStorage>(() => _i26.LocalStorage(
        get<_i23.AuthStorage>(),
        get<_i6.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i27.LocaleRepository>(
      () => _i27.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i28.LoginRepository>(
      () => _i28.LoginRepository(get<_i23.AuthStorage>()));
  gh.factory<_i29.LoginViewModel>(
      () => _i29.LoginViewModel(get<_i28.LoginRepository>()));
  gh.singleton<_i30.NetworkAuthInterceptor>(
      _i30.NetworkAuthInterceptor(get<_i23.AuthStorage>()));
  gh.lazySingleton<_i31.RefreshRepository>(
      () => _i31.RefreshRepository(get<_i23.AuthStorage>()));
  gh.factory<_i32.SplashViewModel>(() => _i32.SplashViewModel(
        get<_i28.LoginRepository>(),
        get<_i26.LocalStorage>(),
      ));
  gh.factory<_i33.TodoAddViewModel>(
      () => _i33.TodoAddViewModel(get<_i22.TodoRepository>()));
  gh.factory<_i34.TodoListViewModel>(
      () => _i34.TodoListViewModel(get<_i22.TodoRepository>()));
  gh.factory<_i35.GlobalViewModel>(() => _i35.GlobalViewModel(
        get<_i27.LocaleRepository>(),
        get<_i24.DebugRepository>(),
        get<_i26.LocalStorage>(),
      ));
  gh.singleton<_i36.NetworkRefreshInterceptor>(_i36.NetworkRefreshInterceptor(
    get<_i23.AuthStorage>(),
    get<_i31.RefreshRepository>(),
  ));
  gh.lazySingleton<_i6.CombiningSmartInterceptor>(
      () => registerModule.provideCombiningSmartInterceptor(
            get<_i15.NetworkLogInterceptor>(),
            get<_i30.NetworkAuthInterceptor>(),
            get<_i14.NetworkErrorInterceptor>(),
            get<_i36.NetworkRefreshInterceptor>(),
          ));
  gh.lazySingleton<_i37.Dio>(
      () => registerModule.provideDio(get<_i6.CombiningSmartInterceptor>()));
  gh.singleton<_i19.TodoService>(
    _i38.TodoWebService(get<_i37.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return get;
}

class _$RegisterModule extends _i39.RegisterModule {}
