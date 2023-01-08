// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i27;
import 'package:firebase_analytics/firebase_analytics.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../database/flutter_template_database.dart' as _i23;
import '../database/todo/todo_dao_storage.dart' as _i22;
import '../navigator/main_navigator.dart' as _i14;
import '../repository/analytics/firebase_analytics_repository.dart' as _i9;
import '../repository/debug/debug_repository.dart' as _i7;
import '../repository/locale/locale_repository.dart' as _i12;
import '../repository/login/login_repository.dart' as _i13;
import '../repository/refresh/refresh_repository.dart' as _i18;
import '../repository/secure_storage/auth/auth_storage.dart' as _i3;
import '../repository/secure_storage/secure_storage.dart' as _i19;
import '../repository/shared_prefs/local/local_storage.dart' as _i11;
import '../repository/todo/todo_repository.dart' as _i37;
import '../util/cache/cache_controller.dart' as _i6;
import '../util/cache/cache_controlling.dart' as _i5;
import '../util/interceptor/network_auth_interceptor.dart' as _i15;
import '../util/interceptor/network_error_interceptor.dart' as _i16;
import '../util/interceptor/network_log_interceptor.dart' as _i17;
import '../util/interceptor/network_refresh_interceptor.dart' as _i36;
import '../util/locale/localization.dart' as _i33;
import '../util/snackbar/error_util.dart' as _i8;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i29;
import '../viewmodel/debug/debug_theme_selector_viewmodel.dart' as _i30;
import '../viewmodel/debug/debug_viewmodel.dart' as _i31;
import '../viewmodel/global/global_viewmodel.dart' as _i32;
import '../viewmodel/license/license_viewmodel.dart' as _i34;
import '../viewmodel/login/login_viewmodel.dart' as _i35;
import '../viewmodel/permission/analytics_permission_viewmodel.dart' as _i28;
import '../viewmodel/splash/splash_viewmodel.dart' as _i21;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i38;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i39;
import '../webservice/todo/todo_dummy_service.dart' as _i25;
import '../webservice/todo/todo_service.dart' as _i24;
import '../webservice/todo/todo_webservice.dart' as _i26;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthStorage>(
      () => _i3.AuthStorage(get<_i4.SimpleKeyValueStorage>()));
  gh.singleton<_i5.CacheControlling>(_i6.CacheController());
  gh.lazySingleton<_i7.DebugRepository>(
      () => _i7.DebugRepository(get<_i4.SharedPreferenceStorage>()));
  gh.lazySingleton<_i8.ErrorUtil>(() => _i8.ErrorUtil());
  gh.lazySingleton<_i9.FireBaseAnalyticsRepository>(
      () => _i9.FireBaseAnalyticsRepository(get<_i10.FirebaseAnalytics>()));
  gh.lazySingleton<_i11.LocalStorage>(() => _i11.LocalStorage(
        get<_i3.AuthStorage>(),
        get<_i4.SharedPreferenceStorage>(),
      ));
  gh.lazySingleton<_i12.LocaleRepository>(
      () => _i12.LocaleRepository(get<_i4.SharedPreferenceStorage>()));
  gh.lazySingleton<_i13.LoginRepository>(
      () => _i13.LoginRepository(get<_i3.AuthStorage>()));
  gh.lazySingleton<_i14.MainNavigator>(
      () => _i14.MainNavigator(get<_i8.ErrorUtil>()));
  gh.singleton<_i15.NetworkAuthInterceptor>(
      _i15.NetworkAuthInterceptor(get<_i3.AuthStorage>()));
  gh.singleton<_i16.NetworkErrorInterceptor>(
      _i16.NetworkErrorInterceptor(get<_i4.ConnectivityHelper>()));
  gh.singleton<_i17.NetworkLogInterceptor>(_i17.NetworkLogInterceptor());
  gh.lazySingleton<_i18.RefreshRepository>(
      () => _i18.RefreshRepository(get<_i3.AuthStorage>()));
  gh.lazySingleton<_i19.SecureStorage>(
      () => _i19.SecureStorage(get<_i20.FlutterSecureStorage>()));
  gh.factory<_i21.SplashViewModel>(() => _i21.SplashViewModel(
        get<_i13.LoginRepository>(),
        get<_i11.LocalStorage>(),
        get<_i14.MainNavigator>(),
      ));
  gh.lazySingleton<_i22.TodoDaoStorage>(
      () => _i22.TodoDaoStorage(get<_i23.FlutterTemplateDatabase>()));
  gh.singleton<_i24.TodoService>(
    _i25.TodoDummyService(),
    registerFor: {_dummy},
  );
  gh.singleton<_i24.TodoService>(
    _i26.TodoWebService(get<_i27.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i28.AnalyticsPermissionViewModel>(
      () => _i28.AnalyticsPermissionViewModel(
            get<_i14.MainNavigator>(),
            get<_i11.LocalStorage>(),
          ));
  gh.factory<_i29.DebugPlatformSelectorViewModel>(
      () => _i29.DebugPlatformSelectorViewModel(get<_i14.MainNavigator>()));
  gh.factory<_i30.DebugThemeSelectorViewmodel>(
      () => _i30.DebugThemeSelectorViewmodel(
            get<_i14.MainNavigator>(),
            get<_i11.LocalStorage>(),
          ));
  gh.factory<_i31.DebugViewModel>(() => _i31.DebugViewModel(
        get<_i7.DebugRepository>(),
        get<_i14.MainNavigator>(),
        get<_i23.FlutterTemplateDatabase>(),
        get<_i11.LocalStorage>(),
      ));
  gh.lazySingleton<_i32.GlobalViewModel>(() => _i32.GlobalViewModel(
        get<_i12.LocaleRepository>(),
        get<_i7.DebugRepository>(),
        get<_i11.LocalStorage>(),
        get<_i33.Localization>(),
      ));
  gh.factory<_i34.LicenseViewModel>(
      () => _i34.LicenseViewModel(get<_i14.MainNavigator>()));
  gh.factory<_i35.LoginViewModel>(() => _i35.LoginViewModel(
        get<_i13.LoginRepository>(),
        get<_i14.MainNavigator>(),
      ));
  gh.singleton<_i36.NetworkRefreshInterceptor>(_i36.NetworkRefreshInterceptor(
    get<_i3.AuthStorage>(),
    get<_i18.RefreshRepository>(),
  ));
  gh.lazySingleton<_i37.TodoRepository>(() => _i37.TodoRepository(
        get<_i24.TodoService>(),
        get<_i22.TodoDaoStorage>(),
      ));
  gh.factory<_i38.TodoAddViewModel>(() => _i38.TodoAddViewModel(
        get<_i37.TodoRepository>(),
        get<_i14.MainNavigator>(),
      ));
  gh.factory<_i39.TodoListViewModel>(() => _i39.TodoListViewModel(
        get<_i37.TodoRepository>(),
        get<_i14.MainNavigator>(),
      ));
  return get;
}
