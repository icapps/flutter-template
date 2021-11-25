// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i33;
import 'package:drift/drift.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../database/flutter_template_database.dart' as _i9;
import '../database/todo/todo_dao_storage.dart' as _i15;
import '../repository/debug/debug_repository.dart' as _i20;
import '../repository/locale/locale_repository.dart' as _i23;
import '../repository/login/login_repository.dart' as _i24;
import '../repository/refresh/refresh_repository.dart' as _i27;
import '../repository/secure_storage/auth/auth_storage.dart' as _i19;
import '../repository/secure_storage/secure_storage.dart' as _i13;
import '../repository/shared_prefs/local/local_storage.dart' as _i22;
import '../repository/todo/todo_repository.dart' as _i18;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i26;
import '../util/interceptor/network_error_interceptor.dart' as _i11;
import '../util/interceptor/network_log_interceptor.dart' as _i12;
import '../util/interceptor/network_refresh_interceptor.dart' as _i32;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i7;
import '../viewmodel/debug/debug_viewmodel.dart' as _i21;
import '../viewmodel/global/global_viewmodel.dart' as _i31;
import '../viewmodel/license/license_viewmodel.dart' as _i10;
import '../viewmodel/login/login_viewmodel.dart' as _i25;
import '../viewmodel/splash/splash_viewmodel.dart' as _i28;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i29;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i30;
import '../webservice/todo/todo_dummy_service.dart' as _i17;
import '../webservice/todo/todo_service.dart' as _i16;
import '../webservice/todo/todo_webservice.dart' as _i34;
import 'injectable.dart' as _i35;

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
  gh.lazySingleton<_i8.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i9.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i6.DatabaseConnection>()));
  gh.factory<_i10.LicenseViewModel>(() => _i10.LicenseViewModel());
  gh.singleton<_i11.NetworkErrorInterceptor>(
      _i11.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i12.NetworkLogInterceptor>(_i12.NetworkLogInterceptor());
  gh.lazySingleton<_i13.SecureStorage>(
      () => _i13.SecureStorage(get<_i8.FlutterSecureStorage>()));
  await gh.singletonAsync<_i14.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i15.TodoDaoStorage>(
      () => _i15.TodoDaoStorage(get<_i9.FlutterTemplateDatabase>()));
  gh.singleton<_i16.TodoService>(_i17.TodoDummyService(),
      registerFor: {_dummy});
  gh.lazySingleton<_i5.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i14.SharedPreferences>()));
  gh.lazySingleton<_i5.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i5.SharedPreferenceStorage>(), get<_i13.SecureStorage>()));
  gh.lazySingleton<_i18.TodoRepository>(() =>
      _i18.TodoRepository(get<_i16.TodoService>(), get<_i15.TodoDaoStorage>()));
  gh.lazySingleton<_i19.AuthStorage>(
      () => _i19.AuthStorage(get<_i5.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i20.DebugRepository>(
      () => _i20.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.factory<_i21.DebugViewModel>(
      () => _i21.DebugViewModel(get<_i20.DebugRepository>()));
  gh.lazySingleton<_i22.LocalStorage>(() => _i22.LocalStorage(
      get<_i19.AuthStorage>(), get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i23.LocaleRepository>(
      () => _i23.LocaleRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i24.LoginRepository>(
      () => _i24.LoginRepository(get<_i19.AuthStorage>()));
  gh.factory<_i25.LoginViewModel>(
      () => _i25.LoginViewModel(get<_i24.LoginRepository>()));
  gh.singleton<_i26.NetworkAuthInterceptor>(
      _i26.NetworkAuthInterceptor(get<_i19.AuthStorage>()));
  gh.lazySingleton<_i27.RefreshRepository>(
      () => _i27.RefreshRepository(get<_i19.AuthStorage>()));
  gh.factory<_i28.SplashViewModel>(() => _i28.SplashViewModel(
      get<_i24.LoginRepository>(), get<_i22.LocalStorage>()));
  gh.factory<_i29.TodoAddViewModel>(
      () => _i29.TodoAddViewModel(get<_i18.TodoRepository>()));
  gh.factory<_i30.TodoListViewModel>(
      () => _i30.TodoListViewModel(get<_i18.TodoRepository>()));
  gh.factory<_i31.GlobalViewModel>(() => _i31.GlobalViewModel(
      get<_i23.LocaleRepository>(), get<_i20.DebugRepository>()));
  gh.singleton<_i32.NetworkRefreshInterceptor>(_i32.NetworkRefreshInterceptor(
      get<_i19.AuthStorage>(), get<_i27.RefreshRepository>()));
  gh.lazySingleton<_i5.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i12.NetworkLogInterceptor>(),
          get<_i26.NetworkAuthInterceptor>(),
          get<_i11.NetworkErrorInterceptor>(),
          get<_i32.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i33.Dio>(
      () => registerModule.provideDio(get<_i5.CombiningSmartInterceptor>()));
  gh.singleton<_i16.TodoService>(_i34.TodoWebService(get<_i33.Dio>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$RegisterModule extends _i35.RegisterModule {}
