// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i36;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../database/flutter_template_database.dart' as _i11;
import '../database/todo/todo_dao_storage.dart' as _i19;
import '../repository/analytics/firebase_analytics_repository.dart' as _i22;
import '../repository/debug/debug_repository.dart' as _i25;
import '../repository/locale/locale_repository.dart' as _i28;
import '../repository/login/login_repository.dart' as _i13;
import '../repository/refresh/refresh_repository.dart' as _i30;
import '../repository/secure_storage/auth/auth_storage.dart' as _i24;
import '../repository/secure_storage/secure_storage.dart' as _i17;
import '../repository/shared_prefs/local/local_storage.dart' as _i27;
import '../repository/todo/todo_repository.dart' as _i23;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i29;
import '../util/interceptor/network_error_interceptor.dart' as _i15;
import '../util/interceptor/network_log_interceptor.dart' as _i16;
import '../util/interceptor/network_refresh_interceptor.dart' as _i35;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i7;
import '../viewmodel/debug/debug_viewmodel.dart' as _i26;
import '../viewmodel/detail/detail_viewmodel.dart' as _i8;
import '../viewmodel/global/global_viewmodel.dart' as _i34;
import '../viewmodel/license/license_viewmodel.dart' as _i12;
import '../viewmodel/login/login_viewmodel.dart' as _i14;
import '../viewmodel/splash/splash_viewmodel.dart' as _i31;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i32;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i33;
import '../webservice/todo/todo_dummy_service.dart' as _i21;
import '../webservice/todo/todo_service.dart' as _i20;
import '../webservice/todo/todo_webservice.dart' as _i37;
import 'injectable.dart' as _i38;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.CacheControlling>(_i4.CacheController());
  gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i6.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true);
  gh.factory<_i7.DebugPlatformSelectorViewModel>(
      () => _i7.DebugPlatformSelectorViewModel());
  gh.factory<_i8.DetailViewModel>(() => _i8.DetailViewModel());
  gh.lazySingleton<_i9.FirebaseAnalytics>(
      () => registerModule.provideFirebaseAnalytics());
  gh.lazySingleton<_i10.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i11.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i6.DatabaseConnection>()));
  gh.factory<_i12.LicenseViewModel>(() => _i12.LicenseViewModel());
  gh.lazySingleton<_i13.LoginRepository>(() => _i13.LoginRepository());
  gh.factory<_i14.LoginViewModel>(
      () => _i14.LoginViewModel(get<_i13.LoginRepository>()));
  gh.singleton<_i15.NetworkErrorInterceptor>(
      _i15.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i16.NetworkLogInterceptor>(_i16.NetworkLogInterceptor());
  gh.lazySingleton<_i17.SecureStorage>(
      () => _i17.SecureStorage(get<_i10.FlutterSecureStorage>()));
  await gh.singletonAsync<_i18.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i19.TodoDaoStorage>(
      () => _i19.TodoDaoStorage(get<_i11.FlutterTemplateDatabase>()));
  gh.singleton<_i20.TodoService>(_i21.TodoDummyService(),
      registerFor: {_dummy});
  gh.lazySingleton<_i22.FireBaseAnalyticsRepository>(
      () => _i22.FireBaseAnalyticsRepository(get<_i9.FirebaseAnalytics>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i18.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i5.SharedPreferenceStorage>(), get<_i17.SecureStorage>()));
  gh.lazySingleton<_i23.TodoRepository>(() =>
      _i23.TodoRepository(get<_i20.TodoService>(), get<_i19.TodoDaoStorage>()));
  gh.lazySingleton<_i24.AuthStorage>(
      () => _i24.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i25.DebugRepository>(
      () => _i25.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.factory<_i26.DebugViewModel>(
      () => _i26.DebugViewModel(get<_i25.DebugRepository>()));
  gh.lazySingleton<_i27.LocalStorage>(() => _i27.LocalStorage(
      get<_i24.AuthStorage>(), get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i28.LocaleRepository>(
      () => _i28.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.singleton<_i29.NetworkAuthInterceptor>(
      _i29.NetworkAuthInterceptor(get<_i24.AuthStorage>()));
  gh.lazySingleton<_i30.RefreshRepository>(
      () => _i30.RefreshRepository(get<_i24.AuthStorage>()));
  gh.factory<_i31.SplashViewModel>(() => _i31.SplashViewModel(
      get<_i13.LoginRepository>(), get<_i27.LocalStorage>()));
  gh.factory<_i32.TodoAddViewModel>(
      () => _i32.TodoAddViewModel(get<_i23.TodoRepository>()));
  gh.factory<_i33.TodoListViewModel>(
      () => _i33.TodoListViewModel(get<_i23.TodoRepository>()));
  gh.factory<_i34.GlobalViewModel>(() => _i34.GlobalViewModel(
      get<_i28.LocaleRepository>(),
      get<_i25.DebugRepository>(),
      get<_i27.LocalStorage>()));
  gh.singleton<_i35.NetworkRefreshInterceptor>(_i35.NetworkRefreshInterceptor(
      get<_i24.AuthStorage>(), get<_i30.RefreshRepository>()));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i16.NetworkLogInterceptor>(),
          get<_i29.NetworkAuthInterceptor>(),
          get<_i15.NetworkErrorInterceptor>(),
          get<_i35.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i36.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.singleton<_i20.TodoService>(_i37.TodoWebService(get<_i36.Dio>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$RegisterModule extends _i38.RegisterModule {}
