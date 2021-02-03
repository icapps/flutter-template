// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/secure_storage/auth/auth_storage.dart';
import '../repository/secure_storage/auth/auth_storing.dart';
import '../util/cache/cache_controller.dart';
import '../util/cache/cache_controlling.dart';
import '../util/interceptor/combining_smart_interceptor.dart';
import '../util/connectivity/connectivity_controller.dart';
import '../util/connectivity/connectivity_controlling.dart';
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart';
import '../repository/debug/debug_repo.dart';
import '../repository/debug/debug_repository.dart';
import '../viewmodel/debug/debug_viewmodel.dart';
import '../database/flutter_template_database.dart';
import '../viewmodel/global/global_viewmodel.dart';
import '../viewmodel/license/license_viewmodel.dart';
import '../repository/shared_prefs/local/local_storage.dart';
import '../repository/shared_prefs/local/local_storing.dart';
import '../repository/locale/locale_repo.dart';
import '../repository/locale/locale_repository.dart';
import '../bridge/logging/logging_bridge.dart';
import '../bridge/logging/logging_bridging.dart';
import '../repository/login/login_repo.dart';
import '../repository/login/login_repository.dart';
import '../viewmodel/login/login_viewmodel.dart';
import '../util/interceptor/network_auth_interceptor.dart';
import '../util/interceptor/network_error_interceptor.dart';
import '../util/interceptor/network_log_interceptor.dart';
import '../util/interceptor/network_refresh_interceptor.dart';
import '../repository/refresh/refresh_repo.dart';
import '../repository/refresh/refresh_repository.dart';
import 'injectable.dart';
import '../repository/secure_storage/secure_storage.dart';
import '../repository/secure_storage/secure_storing.dart';
import '../repository/shared_prefs/shared_prefs_storage.dart';
import '../repository/shared_prefs/shared_prefs_storing.dart';
import '../viewmodel/splash/splash_viewmodel.dart';
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import '../database/todo/todo_dao_storage.dart';
import '../database/todo/todo_dao_storing.dart';
import '../webservice/todo/todo_dummy_service.dart';
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import '../repository/todo/todo_repo.dart';
import '../repository/todo/todo_repository.dart';
import '../webservice/todo/todo_service.dart';
import '../webservice/todo/todo_webservice.dart';

/// Environment names
const _dummy = 'dummy';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<Connectivity>(() => registerModule.connectivity);
  gh.factory<DebugPlatformSelectorViewModel>(
      () => DebugPlatformSelectorViewModel());
  gh.factory<FlutterSecureStorage>(() => registerModule.storage);
  gh.factory<LicenseViewModel>(() => LicenseViewModel());
  gh.factory<QueryExecutor>(() => registerModule.executor);
  final resolvedSharedPreferences = await registerModule.prefs;
  gh.factory<SharedPreferences>(() => resolvedSharedPreferences);
  gh.factory<DebugViewModel>(() => DebugViewModel(get<DebugRepo>()));
  gh.factory<LoginViewModel>(() => LoginViewModel(get<LoginRepo>()));
  gh.factory<SplashViewModel>(
      () => SplashViewModel(get<LoginRepo>(), get<LocalStoring>()));
  gh.factory<GlobalViewModel>(
      () => GlobalViewModel(get<LocaleRepo>(), get<DebugRepo>()));
  gh.lazySingleton<NetworkRefreshInterceptor>(
      () => NetworkRefreshInterceptor(get<AuthStoring>(), get<RefreshRepo>()));
  gh.factory<TodoAddViewModel>(() => TodoAddViewModel(get<TodoRepo>()));
  gh.factory<TodoListViewModel>(() => TodoListViewModel(get<TodoRepo>()));
  gh.factory<CombiningSmartInterceptor>(
      () => registerModule.provideCombiningSmartInterceptor(
            get<NetworkLogInterceptor>(),
            get<NetworkAuthInterceptor>(),
            get<NetworkErrorInterceptor>(),
            get<NetworkRefreshInterceptor>(),
          ));
  gh.factory<Dio>(
      () => registerModule.provideDio(get<CombiningSmartInterceptor>()));
  gh.factory<TodoService>(() => TodoWebService(get<Dio>()));

  // Eager singletons must be registered in the right order
  gh.singleton<CacheControlling>(CacheController());
  gh.singleton<ConnectivityControlling>(
      ConnectivityController(get<Connectivity>()));
  gh.singleton<LoggingBridging>(LoggingBridge());
  gh.singleton<NetworkErrorInterceptor>(
      NetworkErrorInterceptor(get<ConnectivityControlling>()));
  gh.singleton<NetworkLogInterceptor>(NetworkLogInterceptor());
  gh.singleton<SecureStoring>(SecureStorage(get<FlutterSecureStorage>()));
  gh.singleton<SharedPrefsStoring>(
      SharedPrefsStorage(get<SharedPreferences>()));
  gh.singleton<TodoService>(TodoDummyService(), registerFor: {_dummy});
  gh.singleton<AuthStoring>(AuthStorage(get<SecureStoring>()));
  gh.singleton<DebugRepo>(DebugRepository(get<SharedPrefsStoring>()));
  gh.singleton<FlutterTemplateDatabase>(
      FlutterTemplateDatabase(get<QueryExecutor>()));
  gh.singleton<LocalStoring>(
      LocalStorage(get<AuthStoring>(), get<SharedPrefsStoring>()));
  gh.singleton<LocaleRepo>(LocaleRepository(get<SharedPrefsStoring>()));
  gh.singleton<LoginRepo>(LoginRepository(get<AuthStoring>()));
  gh.singleton<NetworkAuthInterceptor>(
      NetworkAuthInterceptor(get<AuthStoring>()));
  gh.singleton<RefreshRepo>(RefreshRepository(get<AuthStoring>()));
  gh.singleton<TodoDaoStoring>(TodoDaoStorage(get<FlutterTemplateDatabase>()));
  gh.singleton<TodoRepo>(
      TodoRepository(get<TodoService>(), get<TodoDaoStoring>()));
  return get;
}

class _$RegisterModule extends RegisterModule {}
