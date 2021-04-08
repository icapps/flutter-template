// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i46;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i23;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i21;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moor/moor.dart' as _i22;
import 'package:shared_preferences/shared_preferences.dart' as _i31;

import '../bridge/logging/logging_bridge.dart' as _i26;
import '../bridge/logging/logging_bridging.dart' as _i25;
import '../database/flutter_template_database.dart' as _i24;
import '../database/todo/todo_dao_storage.dart' as _i34;
import '../database/todo/todo_dao_storing.dart' as _i14;
import '../repository/debug/debug_repo.dart' as _i6;
import '../repository/debug/debug_repository.dart' as _i38;
import '../repository/locale/locale_repo.dart' as _i16;
import '../repository/locale/locale_repository.dart' as _i40;
import '../repository/login/login_repo.dart' as _i8;
import '../repository/login/login_repository.dart' as _i41;
import '../repository/refresh/refresh_repo.dart' as _i43;
import '../repository/refresh/refresh_repository.dart' as _i44;
import '../repository/secure_storage/auth/auth_storage.dart' as _i37;
import '../repository/secure_storage/auth/auth_storing.dart' as _i36;
import '../repository/secure_storage/secure_storage.dart' as _i30;
import '../repository/secure_storage/secure_storing.dart' as _i29;
import '../repository/shared_prefs/local/local_storage.dart' as _i39;
import '../repository/shared_prefs/local/local_storing.dart' as _i10;
import '../repository/shared_prefs/shared_prefs_storage.dart' as _i33;
import '../repository/shared_prefs/shared_prefs_storing.dart' as _i32;
import '../repository/todo/todo_repo.dart' as _i11;
import '../repository/todo/todo_repository.dart' as _i12;
import '../util/cache/cache_controller.dart' as _i20;
import '../util/cache/cache_controlling.dart' as _i19;
import '../util/interceptor/network_auth_interceptor.dart' as _i42;
import '../util/interceptor/network_error_interceptor.dart' as _i27;
import '../util/interceptor/network_log_interceptor.dart' as _i28;
import '../util/interceptor/network_refresh_interceptor.dart' as _i45;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i3;
import '../viewmodel/debug/debug_viewmodel.dart' as _i5;
import '../viewmodel/global/global_viewmodel.dart' as _i15;
import '../viewmodel/license/license_viewmodel.dart' as _i4;
import '../viewmodel/login/login_viewmodel.dart' as _i7;
import '../viewmodel/splash/splash_viewmodel.dart' as _i9;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i17;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i18;
import '../webservice/todo/todo_dummy_service.dart' as _i35;
import '../webservice/todo/todo_service.dart' as _i13;
import '../webservice/todo/todo_webservice.dart' as _i47;
import 'injectable.dart' as _i48;

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
  gh.factory<_i3.DebugPlatformSelectorViewModel>(
      () => _i3.DebugPlatformSelectorViewModel());
  gh.factory<_i4.LicenseViewModel>(() => _i4.LicenseViewModel());
  gh.factory<_i5.DebugViewModel>(
      () => _i5.DebugViewModel(get<_i6.DebugRepo>()));
  gh.factory<_i7.LoginViewModel>(
      () => _i7.LoginViewModel(get<_i8.LoginRepo>()));
  gh.factory<_i9.SplashViewModel>(() =>
      _i9.SplashViewModel(get<_i8.LoginRepo>(), get<_i10.LocalStoring>()));
  gh.lazySingleton<_i11.TodoRepo>(() =>
      _i12.TodoRepository(get<_i13.TodoService>(), get<_i14.TodoDaoStoring>()));
  gh.factory<_i15.GlobalViewModel>(
      () => _i15.GlobalViewModel(get<_i16.LocaleRepo>(), get<_i6.DebugRepo>()));
  gh.factory<_i17.TodoAddViewModel>(
      () => _i17.TodoAddViewModel(get<_i11.TodoRepo>()));
  gh.factory<_i18.TodoListViewModel>(
      () => _i18.TodoListViewModel(get<_i11.TodoRepo>()));
  gh.singleton<_i19.CacheControlling>(_i20.CacheController());
  gh.singleton<_i21.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i22.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true);
  gh.singleton<_i23.FlutterSecureStorage>(registerModule.storage());
  gh.singleton<_i24.FlutterTemplateDatabase>(registerModule
      .provideFlutterTemplateDatabase(get<_i22.DatabaseConnection>()));
  gh.singleton<_i25.LoggingBridging>(_i26.LoggingBridge());
  gh.singleton<_i27.NetworkErrorInterceptor>(
      _i27.NetworkErrorInterceptor(get<_i21.ConnectivityHelper>()));
  gh.singleton<_i28.NetworkLogInterceptor>(_i28.NetworkLogInterceptor());
  gh.singleton<_i22.QueryExecutor>(registerModule.executor());
  gh.singleton<_i29.SecureStoring>(
      _i30.SecureStorage(get<_i23.FlutterSecureStorage>()));
  await gh.singletonAsync<_i31.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.singleton<_i32.SharedPrefsStoring>(
      _i33.SharedPrefsStorage(get<_i31.SharedPreferences>()));
  gh.singleton<_i14.TodoDaoStoring>(
      _i34.TodoDaoStorage(get<_i24.FlutterTemplateDatabase>()));
  gh.singleton<_i13.TodoService>(_i35.TodoDummyService(),
      registerFor: {_dummy});
  gh.singleton<_i36.AuthStoring>(_i37.AuthStorage(get<_i29.SecureStoring>()));
  gh.singleton<_i6.DebugRepo>(
      _i38.DebugRepository(get<_i32.SharedPrefsStoring>()));
  gh.singleton<_i10.LocalStoring>(_i39.LocalStorage(
      get<_i36.AuthStoring>(), get<_i32.SharedPrefsStoring>()));
  gh.singleton<_i16.LocaleRepo>(
      _i40.LocaleRepository(get<_i32.SharedPrefsStoring>()));
  gh.singleton<_i8.LoginRepo>(_i41.LoginRepository(get<_i36.AuthStoring>()));
  gh.singleton<_i42.NetworkAuthInterceptor>(
      _i42.NetworkAuthInterceptor(get<_i36.AuthStoring>()));
  gh.singleton<_i43.RefreshRepo>(
      _i44.RefreshRepository(get<_i36.AuthStoring>()));
  gh.singleton<_i45.NetworkRefreshInterceptor>(_i45.NetworkRefreshInterceptor(
      get<_i36.AuthStoring>(), get<_i43.RefreshRepo>()));
  gh.singleton<_i21.CombiningSmartInterceptor>(
      registerModule.provideCombiningSmartInterceptor(
          get<_i28.NetworkLogInterceptor>(),
          get<_i42.NetworkAuthInterceptor>(),
          get<_i27.NetworkErrorInterceptor>(),
          get<_i45.NetworkRefreshInterceptor>()));
  gh.singleton<_i46.Dio>(
      registerModule.provideDio(get<_i21.CombiningSmartInterceptor>()));
  gh.singleton<_i13.TodoService>(_i47.TodoWebService(get<_i46.Dio>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$RegisterModule extends _i48.RegisterModule {}
