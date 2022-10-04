// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i29;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../database/flutter_template_database.dart' as _i9;
import '../database/todo/todo_dao_storage.dart' as _i15;
import '../navigator/main_navigator.dart' as _i31;
import '../repository/analytics/firebase_analytics_repository.dart' as _i18;
import '../repository/debug/debug_repository.dart' as _i21;
import '../repository/locale/locale_repository.dart' as _i23;
import '../repository/login/login_repository.dart' as _i24;
import '../repository/refresh/refresh_repository.dart' as _i26;
import '../repository/secure_storage/auth/auth_storage.dart' as _i20;
import '../repository/secure_storage/secure_storage.dart' as _i13;
import '../repository/shared_prefs/local/local_storage.dart' as _i22;
import '../repository/todo/todo_repository.dart' as _i19;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i25;
import '../util/interceptor/network_error_interceptor.dart' as _i11;
import '../util/interceptor/network_log_interceptor.dart' as _i12;
import '../util/interceptor/network_refresh_interceptor.dart' as _i28;
import '../util/locale/localization.dart' as _i10;
import '../util/snackbar/error_util.dart' as _i30;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i36;
import '../viewmodel/debug/debug_viewmodel.dart' as _i37;
import '../viewmodel/global/global_viewmodel.dart' as _i27;
import '../viewmodel/license/license_viewmodel.dart' as _i38;
import '../viewmodel/login/login_viewmodel.dart' as _i39;
import '../viewmodel/splash/splash_viewmodel.dart' as _i32;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i33;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i34;
import '../webservice/todo/todo_dummy_service.dart' as _i17;
import '../webservice/todo/todo_service.dart' as _i16;
import '../webservice/todo/todo_webservice.dart' as _i35;
import 'injectable.dart' as _i40;

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
  gh.lazySingleton<_i10.Localization>(() => registerModule.localization());
  gh.singleton<_i11.NetworkErrorInterceptor>(
      _i11.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i12.NetworkLogInterceptor>(_i12.NetworkLogInterceptor());
  gh.lazySingleton<_i13.SecureStorage>(
      () => _i13.SecureStorage(get<_i8.FlutterSecureStorage>()));
  await gh.singletonAsync<_i14.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i15.TodoDaoStorage>(
      () => _i15.TodoDaoStorage(get<_i9.FlutterTemplateDatabase>()));
  gh.singleton<_i16.TodoService>(
    _i17.TodoDummyService(),
    registerFor: {_dummy},
  );
  gh.lazySingleton<_i18.FireBaseAnalyticsRepository>(
      () => _i18.FireBaseAnalyticsRepository(get<_i7.FirebaseAnalytics>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(
      () => registerModule.keyValueStorage(
            get<_i5.SharedPreferenceStorage>(),
            get<_i13.SecureStorage>(),
          ));
  gh.lazySingleton<_i19.TodoRepository>(() => _i19.TodoRepository(
        get<_i16.TodoService>(),
        get<_i15.TodoDaoStorage>(),
      ));
  gh.lazySingleton<_i20.AuthStorage>(
      () => _i20.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i21.DebugRepository>(
      () => _i21.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i22.LocalStorage>(() => _i22.LocalStorage(
        get<_i20.AuthStorage>(),
        get<_i5.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i23.LocaleRepository>(
      () => _i23.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i24.LoginRepository>(
      () => _i24.LoginRepository(get<_i20.AuthStorage>()));
  gh.singleton<_i25.NetworkAuthInterceptor>(
      _i25.NetworkAuthInterceptor(get<_i20.AuthStorage>()));
  gh.lazySingleton<_i26.RefreshRepository>(
      () => _i26.RefreshRepository(get<_i20.AuthStorage>()));
  gh.lazySingleton<_i27.GlobalViewModel>(() => _i27.GlobalViewModel(
        get<_i23.LocaleRepository>(),
        get<_i21.DebugRepository>(),
        get<_i22.LocalStorage>(),
        get<_i10.Localization>(),
      ));
  gh.singleton<_i28.NetworkRefreshInterceptor>(_i28.NetworkRefreshInterceptor(
    get<_i20.AuthStorage>(),
    get<_i26.RefreshRepository>(),
  ));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(
      () => registerModule.provideCombiningSmartInterceptor(
            get<_i12.NetworkLogInterceptor>(),
            get<_i25.NetworkAuthInterceptor>(),
            get<_i11.NetworkErrorInterceptor>(),
            get<_i28.NetworkRefreshInterceptor>(),
          ));
  gh.lazySingleton<_i29.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.lazySingleton<_i30.ErrorUtil>(
      () => _i30.ErrorUtil(get<_i27.GlobalViewModel>()));
  gh.lazySingleton<_i31.MainNavigator>(
      () => _i31.MainNavigator(get<_i30.ErrorUtil>()));
  gh.factory<_i32.SplashViewModel>(() => _i32.SplashViewModel(
        get<_i24.LoginRepository>(),
        get<_i22.LocalStorage>(),
        get<_i31.MainNavigator>(),
      ));
  gh.factory<_i33.TodoAddViewModel>(() => _i33.TodoAddViewModel(
        get<_i19.TodoRepository>(),
        get<_i31.MainNavigator>(),
      ));
  gh.factory<_i34.TodoListViewModel>(() => _i34.TodoListViewModel(
        get<_i19.TodoRepository>(),
        get<_i31.MainNavigator>(),
      ));
  gh.singleton<_i16.TodoService>(
    _i35.TodoWebService(get<_i29.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i36.DebugPlatformSelectorViewModel>(
      () => _i36.DebugPlatformSelectorViewModel(get<_i31.MainNavigator>()));
  gh.factory<_i37.DebugViewModel>(() => _i37.DebugViewModel(
        get<_i21.DebugRepository>(),
        get<_i31.MainNavigator>(),
        get<_i9.FlutterTemplateDatabase>(),
      ));
  gh.factory<_i38.LicenseViewModel>(
      () => _i38.LicenseViewModel(get<_i31.MainNavigator>()));
  gh.factory<_i39.LoginViewModel>(() => _i39.LoginViewModel(
        get<_i24.LoginRepository>(),
        get<_i31.MainNavigator>(),
      ));
  return get;
}

class _$RegisterModule extends _i40.RegisterModule {}
