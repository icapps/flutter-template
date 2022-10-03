// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i28;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../database/flutter_template_database.dart' as _i9;
import '../database/todo/todo_dao_storage.dart' as _i14;
import '../navigator/main_navigator.dart' as _i30;
import '../repository/analytics/firebase_analytics_repository.dart' as _i17;
import '../repository/debug/debug_repository.dart' as _i20;
import '../repository/locale/locale_repository.dart' as _i22;
import '../repository/login/login_repository.dart' as _i23;
import '../repository/refresh/refresh_repository.dart' as _i25;
import '../repository/secure_storage/auth/auth_storage.dart' as _i19;
import '../repository/secure_storage/secure_storage.dart' as _i12;
import '../repository/shared_prefs/local/local_storage.dart' as _i21;
import '../repository/todo/todo_repository.dart' as _i18;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i24;
import '../util/interceptor/network_error_interceptor.dart' as _i10;
import '../util/interceptor/network_log_interceptor.dart' as _i11;
import '../util/interceptor/network_refresh_interceptor.dart' as _i27;
import '../util/snackbar/error_util.dart' as _i29;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i35;
import '../viewmodel/debug/debug_viewmodel.dart' as _i36;
import '../viewmodel/global/global_viewmodel.dart' as _i26;
import '../viewmodel/license/license_viewmodel.dart' as _i37;
import '../viewmodel/login/login_viewmodel.dart' as _i38;
import '../viewmodel/splash/splash_viewmodel.dart' as _i31;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i32;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i33;
import '../webservice/todo/todo_dummy_service.dart' as _i16;
import '../webservice/todo/todo_service.dart' as _i15;
import '../webservice/todo/todo_webservice.dart' as _i34;
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
  gh.singleton<_i3.CacheControlling>(_i4.CacheController());
  gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i6.DatabaseConnection>(
    () => registerModule.provideDatabaseConnection(),
    preResolve: true,
  );
  gh.lazySingleton<_i7.FirebaseAnalytics>(
      () => registerModule.provideFirebaseAnalytics());
  gh.lazySingleton<_i8.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i9.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i6.DatabaseConnection>()));
  gh.singleton<_i10.NetworkErrorInterceptor>(
      _i10.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i11.NetworkLogInterceptor>(_i11.NetworkLogInterceptor());
  gh.lazySingleton<_i12.SecureStorage>(
      () => _i12.SecureStorage(get<_i8.FlutterSecureStorage>()));
  await gh.singletonAsync<_i13.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i14.TodoDaoStorage>(
      () => _i14.TodoDaoStorage(get<_i9.FlutterTemplateDatabase>()));
  gh.singleton<_i15.TodoService>(
    _i16.TodoDummyService(),
    registerFor: {_dummy},
  );
  gh.lazySingleton<_i17.FireBaseAnalyticsRepository>(
      () => _i17.FireBaseAnalyticsRepository(get<_i7.FirebaseAnalytics>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i5.SharedPreferenceStorage>(),
            get<_i12.SecureStorage>(),
          ));
  gh.lazySingleton<_i18.TodoRepository>(() => _i18.TodoRepository(
        get<_i15.TodoService>(),
        get<_i14.TodoDaoStorage>(),
      ));
  gh.lazySingleton<_i19.AuthStorage>(
      () => _i19.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i20.DebugRepository>(
      () => _i20.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i21.LocalStorage>(() => _i21.LocalStorage(
        get<_i19.AuthStorage>(),
        get<_i5.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i22.LocaleRepository>(
      () => _i22.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i23.LoginRepository>(
      () => _i23.LoginRepository(get<_i19.AuthStorage>()));
  gh.singleton<_i24.NetworkAuthInterceptor>(
      _i24.NetworkAuthInterceptor(get<_i19.AuthStorage>()));
  gh.lazySingleton<_i25.RefreshRepository>(
      () => _i25.RefreshRepository(get<_i19.AuthStorage>()));
  gh.lazySingleton<_i26.GlobalViewModel>(() => _i26.GlobalViewModel(
        get<_i22.LocaleRepository>(),
        get<_i20.DebugRepository>(),
        get<_i21.LocalStorage>(),
      ));
  gh.singleton<_i27.NetworkRefreshInterceptor>(_i27.NetworkRefreshInterceptor(
    get<_i19.AuthStorage>(),
    get<_i25.RefreshRepository>(),
  ));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(
      () => registerModule.provideCombiningSmartInterceptor(
            get<_i11.NetworkLogInterceptor>(),
            get<_i24.NetworkAuthInterceptor>(),
            get<_i10.NetworkErrorInterceptor>(),
            get<_i27.NetworkRefreshInterceptor>(),
          ));
  gh.lazySingleton<_i28.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.lazySingleton<_i29.ErrorUtil>(
      () => _i29.ErrorUtil(get<_i26.GlobalViewModel>()));
  gh.lazySingleton<_i30.MainNavigator>(
      () => _i30.MainNavigator(get<_i29.ErrorUtil>()));
  gh.factory<_i31.SplashViewModel>(() => _i31.SplashViewModel(
        get<_i23.LoginRepository>(),
        get<_i21.LocalStorage>(),
        get<_i30.MainNavigator>(),
      ));
  gh.factory<_i32.TodoAddViewModel>(() => _i32.TodoAddViewModel(
        get<_i18.TodoRepository>(),
        get<_i30.MainNavigator>(),
      ));
  gh.factory<_i33.TodoListViewModel>(() => _i33.TodoListViewModel(
        get<_i18.TodoRepository>(),
        get<_i30.MainNavigator>(),
      ));
  gh.singleton<_i15.TodoService>(
    _i34.TodoWebService(get<_i28.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i35.DebugPlatformSelectorViewModel>(
      () => _i35.DebugPlatformSelectorViewModel(get<_i30.MainNavigator>()));
  gh.factory<_i36.DebugViewModel>(() => _i36.DebugViewModel(
        get<_i20.DebugRepository>(),
        get<_i30.MainNavigator>(),
        get<_i9.FlutterTemplateDatabase>(),
      ));
  gh.factory<_i37.LicenseViewModel>(
      () => _i37.LicenseViewModel(get<_i30.MainNavigator>()));
  gh.factory<_i38.LoginViewModel>(() => _i38.LoginViewModel(
        get<_i23.LoginRepository>(),
        get<_i30.MainNavigator>(),
      ));
  return get;
}

class _$RegisterModule extends _i39.RegisterModule {}
