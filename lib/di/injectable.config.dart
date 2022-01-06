// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i35;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../database/flutter_template_database.dart' as _i10;
import '../database/todo/todo_dao_storage.dart' as _i16;
import '../repository/analytics/firebase_analytics_repository.dart' as _i19;
import '../repository/debug/debug_repository.dart' as _i22;
import '../repository/locale/locale_repository.dart' as _i25;
import '../repository/login/login_repository.dart' as _i26;
import '../repository/refresh/refresh_repository.dart' as _i29;
import '../repository/secure_storage/auth/auth_storage.dart' as _i21;
import '../repository/secure_storage/secure_storage.dart' as _i14;
import '../repository/shared_prefs/local/local_storage.dart' as _i24;
import '../repository/todo/todo_repository.dart' as _i20;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i28;
import '../util/interceptor/network_error_interceptor.dart' as _i12;
import '../util/interceptor/network_log_interceptor.dart' as _i13;
import '../util/interceptor/network_refresh_interceptor.dart' as _i34;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i7;
import '../viewmodel/debug/debug_viewmodel.dart' as _i23;
import '../viewmodel/global/global_viewmodel.dart' as _i33;
import '../viewmodel/license/license_viewmodel.dart' as _i11;
import '../viewmodel/login/login_viewmodel.dart' as _i27;
import '../viewmodel/splash/splash_viewmodel.dart' as _i30;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i31;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i32;
import '../webservice/todo/todo_dummy_service.dart' as _i18;
import '../webservice/todo/todo_service.dart' as _i17;
import '../webservice/todo/todo_webservice.dart' as _i36;
import 'injectable.dart' as _i37;

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
  gh.singleton<_i8.FirebaseAnalytics>(
      registerModule.provideFirebaseAnalytics());
  gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i10.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i6.DatabaseConnection>()));
  gh.factory<_i11.LicenseViewModel>(() => _i11.LicenseViewModel());
  gh.singleton<_i12.NetworkErrorInterceptor>(
      _i12.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i13.NetworkLogInterceptor>(_i13.NetworkLogInterceptor());
  gh.lazySingleton<_i14.SecureStorage>(
      () => _i14.SecureStorage(get<_i9.FlutterSecureStorage>()));
  await gh.singletonAsync<_i15.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i16.TodoDaoStorage>(
      () => _i16.TodoDaoStorage(get<_i10.FlutterTemplateDatabase>()));
  gh.singleton<_i17.TodoService>(_i18.TodoDummyService(),
      registerFor: {_dummy});
  gh.lazySingleton<_i19.FireBaseAnalyticsRepository>(
      () => _i19.FireBaseAnalyticsRepository(get<_i8.FirebaseAnalytics>()));
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i5.SharedPreferenceStorage>(), get<_i14.SecureStorage>()));
  gh.lazySingleton<_i20.TodoRepository>(() =>
      _i20.TodoRepository(get<_i17.TodoService>(), get<_i16.TodoDaoStorage>()));
  gh.lazySingleton<_i21.AuthStorage>(
      () => _i21.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i22.DebugRepository>(
      () => _i22.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.factory<_i23.DebugViewModel>(
      () => _i23.DebugViewModel(get<_i22.DebugRepository>()));
  gh.lazySingleton<_i24.LocalStorage>(() => _i24.LocalStorage(
      get<_i21.AuthStorage>(), get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i25.LocaleRepository>(
      () => _i25.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i26.LoginRepository>(
      () => _i26.LoginRepository(get<_i21.AuthStorage>()));
  gh.factory<_i27.LoginViewModel>(
      () => _i27.LoginViewModel(get<_i26.LoginRepository>()));
  gh.singleton<_i28.NetworkAuthInterceptor>(
      _i28.NetworkAuthInterceptor(get<_i21.AuthStorage>()));
  gh.lazySingleton<_i29.RefreshRepository>(
      () => _i29.RefreshRepository(get<_i21.AuthStorage>()));
  gh.factory<_i30.SplashViewModel>(() => _i30.SplashViewModel(
      get<_i26.LoginRepository>(), get<_i24.LocalStorage>()));
  gh.factory<_i31.TodoAddViewModel>(
      () => _i31.TodoAddViewModel(get<_i20.TodoRepository>()));
  gh.factory<_i32.TodoListViewModel>(
      () => _i32.TodoListViewModel(get<_i20.TodoRepository>()));
  gh.factory<_i33.GlobalViewModel>(() => _i33.GlobalViewModel(
      get<_i25.LocaleRepository>(), get<_i22.DebugRepository>()));
  gh.singleton<_i34.NetworkRefreshInterceptor>(_i34.NetworkRefreshInterceptor(
      get<_i21.AuthStorage>(), get<_i29.RefreshRepository>()));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i13.NetworkLogInterceptor>(),
          get<_i28.NetworkAuthInterceptor>(),
          get<_i12.NetworkErrorInterceptor>(),
          get<_i34.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i35.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.singleton<_i17.TodoService>(_i36.TodoWebService(get<_i35.Dio>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$RegisterModule extends _i37.RegisterModule {}
