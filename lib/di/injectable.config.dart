// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i52;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i9;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i10;
import 'package:firebase_storage/firebase_storage.dart' as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:flutter_template/database/flutter_template_database.dart'
    as _i13;
import 'package:flutter_template/database/todo/todo_dao_storage.dart' as _i24;
import 'package:flutter_template/di/injectable.dart' as _i54;
import 'package:flutter_template/navigator/main_navigator.dart' as _i16;
import 'package:flutter_template/navigator/onboarding_navigator.dart' as _i39;
import 'package:flutter_template/repository/analytics/firebase_analytics_repository.dart'
    as _i27;
import 'package:flutter_template/repository/debug/debug_repository.dart'
    as _i32;
import 'package:flutter_template/repository/locale/locale_repository.dart'
    as _i34;
import 'package:flutter_template/repository/logging/logging_repository.dart'
    as _i35;
import 'package:flutter_template/repository/login/login_repository.dart'
    as _i36;
import 'package:flutter_template/repository/refresh/refresh_repository.dart'
    as _i40;
import 'package:flutter_template/repository/remote_config/remote_config.dart'
    as _i19;
import 'package:flutter_template/repository/remote_config/remote_config_repository.dart'
    as _i20;
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart'
    as _i31;
import 'package:flutter_template/repository/secure_storage/secure_storage.dart'
    as _i21;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i33;
import 'package:flutter_template/repository/todo/todo_repository.dart' as _i30;
import 'package:flutter_template/util/cache/cache_controller.dart' as _i4;
import 'package:flutter_template/util/cache/cache_controlling.dart' as _i3;
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart'
    as _i38;
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart'
    as _i17;
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart'
    as _i18;
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart'
    as _i49;
import 'package:flutter_template/util/locale/localization_overrides.dart'
    as _i14;
import 'package:flutter_template/util/locale/localization_overrides_impl.dart'
    as _i15;
import 'package:flutter_template/util/snackbar/error_util.dart' as _i7;
import 'package:flutter_template/util/theme/theme_config.dart' as _i23;
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i50;
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i51;
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart' as _i45;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart'
    as _i46;
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart'
    as _i28;
import 'package:flutter_template/viewmodel/log_detail/log_detail_viewmodel.dart'
    as _i47;
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart' as _i48;
import 'package:flutter_template/viewmodel/logs/logs_viewmodel.dart' as _i37;
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i44;
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart'
    as _i41;
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart'
    as _i42;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i43;
import 'package:flutter_template/webservice/todo/todo_dummy_service.dart'
    as _i26;
import 'package:flutter_template/webservice/todo/todo_service.dart' as _i25;
import 'package:flutter_template/webservice/todo/todo_webservice.dart' as _i53;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:log_to_secure_file/log_to_secure_file.dart' as _i29;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.CacheControlling>(() => _i4.CacheController());
    gh.singleton<_i5.ConnectivityHelper>(
        () => registerModule.connectivityHelper());
    await gh.singletonAsync<_i6.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true,
    );
    gh.lazySingleton<_i7.ErrorUtil>(() => _i7.ErrorUtil());
    gh.lazySingleton<_i8.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i9.FirebaseCrashlytics>(
        () => registerModule.provideFirebaseCrashlytics());
    gh.lazySingleton<_i10.FirebaseRemoteConfig>(
        () => registerModule.provideFirebaseRemoteConfig());
    gh.lazySingleton<_i11.FirebaseStorage>(
        () => registerModule.provideFirebaseStorage());
    gh.lazySingleton<_i12.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i13.FlutterTemplateDatabase>(() => registerModule
        .provideFlutterTemplateDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i14.LocalizationOverrides>(
        () => _i15.LocalizationOverridesImpl());
    gh.lazySingleton<_i16.MainNavigator>(
        () => _i16.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i17.NetworkErrorInterceptor>(
        () => _i17.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i18.NetworkLogInterceptor>(
        () => _i18.NetworkLogInterceptor());
    gh.lazySingleton<_i19.RemoteConfig>(() => _i19.RemoteConfig());
    gh.lazySingleton<_i20.RemoteConfigRepository>(
        () => _i20.RemoteConfigRepository(gh<_i10.FirebaseRemoteConfig>()));
    gh.lazySingleton<_i21.SecureStorage>(
        () => _i21.SecureStorage(gh<_i12.FlutterSecureStorage>()));
    await gh.singletonAsync<_i22.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i23.ThemeConfigUtil>(() => _i23.ThemeConfigUtil());
    gh.lazySingleton<_i24.TodoDaoStorage>(
        () => _i24.TodoDaoStorage(gh<_i13.FlutterTemplateDatabase>()));
    gh.singleton<_i25.TodoService>(
      () => _i26.TodoDummyService(),
      registerFor: {_dummy},
    );
    gh.lazySingleton<_i27.FireBaseAnalyticsRepository>(
        () => _i27.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.factory<_i28.LicenseViewModel>(
        () => _i28.LicenseViewModel(gh<_i16.MainNavigator>()));
    gh.lazySingleton<_i29.SecureLogStorage>(
        () => registerModule.provideSecureLogStorage(gh<_i21.SecureStorage>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i22.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i21.SecureStorage>(),
            ));
    gh.lazySingleton<_i30.TodoRepository>(() => _i30.TodoRepository(
          gh<_i25.TodoService>(),
          gh<_i24.TodoDaoStorage>(),
        ));
    gh.lazySingleton<_i31.AuthStorage>(
        () => _i31.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i32.DebugRepository>(
        () => _i32.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i33.LocalStorage>(() => _i33.LocalStorage(
          gh<_i31.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i34.LocaleRepository>(
        () => _i34.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i35.LoggingRepository>(() => _i35.LoggingRepository(
          gh<_i11.FirebaseStorage>(),
          gh<_i29.SecureLogStorage>(),
        ));
    gh.lazySingleton<_i36.LoginRepository>(
        () => _i36.LoginRepository(gh<_i31.AuthStorage>()));
    gh.factory<_i37.LogsViewModel>(() => _i37.LogsViewModel(
          gh<_i16.MainNavigator>(),
          gh<_i29.SecureLogStorage>(),
        ));
    gh.singleton<_i38.NetworkAuthInterceptor>(
        () => _i38.NetworkAuthInterceptor(gh<_i31.AuthStorage>()));
    gh.lazySingleton<_i39.OnboardingNavigator>(() => _i39.OnboardingNavigator(
          gh<_i16.MainNavigator>(),
          gh<_i33.LocalStorage>(),
          gh<_i36.LoginRepository>(),
        ));
    gh.lazySingleton<_i40.RefreshRepository>(
        () => _i40.RefreshRepository(gh<_i31.AuthStorage>()));
    gh.factory<_i41.SplashViewModel>(() => _i41.SplashViewModel(
          gh<_i33.LocalStorage>(),
          gh<_i39.OnboardingNavigator>(),
          gh<_i20.RemoteConfigRepository>(),
        ));
    gh.factory<_i42.TodoAddViewModel>(() => _i42.TodoAddViewModel(
          gh<_i30.TodoRepository>(),
          gh<_i16.MainNavigator>(),
        ));
    gh.factory<_i43.TodoListViewModel>(() => _i43.TodoListViewModel(
          gh<_i30.TodoRepository>(),
          gh<_i16.MainNavigator>(),
        ));
    gh.factory<_i44.AnalyticsPermissionViewModel>(
        () => _i44.AnalyticsPermissionViewModel(
              gh<_i39.OnboardingNavigator>(),
              gh<_i33.LocalStorage>(),
            ));
    gh.factory<_i45.DebugViewModel>(() => _i45.DebugViewModel(
          gh<_i32.DebugRepository>(),
          gh<_i16.MainNavigator>(),
          gh<_i13.FlutterTemplateDatabase>(),
          gh<_i33.LocalStorage>(),
        ));
    gh.lazySingleton<_i46.GlobalViewModel>(() => _i46.GlobalViewModel(
          gh<_i34.LocaleRepository>(),
          gh<_i32.DebugRepository>(),
          gh<_i33.LocalStorage>(),
          gh<_i23.ThemeConfigUtil>(),
          gh<_i14.LocalizationOverrides>(),
        ));
    gh.factory<_i47.LogDetailViewModel>(() => _i47.LogDetailViewModel(
          gh<_i29.SecureLogStorage>(),
          gh<_i35.LoggingRepository>(),
        ));
    gh.factory<_i48.LoginViewModel>(() => _i48.LoginViewModel(
          gh<_i36.LoginRepository>(),
          gh<_i16.MainNavigator>(),
          gh<_i39.OnboardingNavigator>(),
        ));
    gh.singleton<_i49.NetworkRefreshInterceptor>(
        () => _i49.NetworkRefreshInterceptor(
              gh<_i31.AuthStorage>(),
              gh<_i40.RefreshRepository>(),
            ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i18.NetworkLogInterceptor>(),
              gh<_i38.NetworkAuthInterceptor>(),
              gh<_i17.NetworkErrorInterceptor>(),
              gh<_i49.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i50.DebugPlatformSelectorViewModel>(
        () => _i50.DebugPlatformSelectorViewModel(
              gh<_i46.GlobalViewModel>(),
              gh<_i16.MainNavigator>(),
            ));
    gh.factory<_i51.DebugThemeSelectorViewModel>(
        () => _i51.DebugThemeSelectorViewModel(
              gh<_i16.MainNavigator>(),
              gh<_i46.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i52.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    gh.singleton<_i25.TodoService>(
      () => _i53.TodoWebService(gh<_i52.Dio>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$RegisterModule extends _i54.RegisterModule {}
