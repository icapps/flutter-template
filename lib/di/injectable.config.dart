// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:drift/drift.dart' as _i500;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:flutter_template/database/flutter_template_database.dart'
    as _i327;
import 'package:flutter_template/database/todo/todo_dao_storage.dart' as _i661;
import 'package:flutter_template/di/injectable.dart' as _i480;
import 'package:flutter_template/navigator/main_navigator.dart' as _i861;
import 'package:flutter_template/navigator/onboarding_navigator.dart' as _i76;
import 'package:flutter_template/repository/analytics/firebase_analytics_repository.dart'
    as _i192;
import 'package:flutter_template/repository/debug/debug_repository.dart'
    as _i380;
import 'package:flutter_template/repository/locale/locale_repository.dart'
    as _i587;
import 'package:flutter_template/repository/login/login_repository.dart'
    as _i726;
import 'package:flutter_template/repository/refresh/refresh_repository.dart'
    as _i529;
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart'
    as _i559;
import 'package:flutter_template/repository/secure_storage/secure_storage.dart'
    as _i658;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i855;
import 'package:flutter_template/repository/todo/todo_repository.dart' as _i955;
import 'package:flutter_template/util/cache/cache_controller.dart' as _i979;
import 'package:flutter_template/util/cache/cache_controlling.dart' as _i40;
import 'package:flutter_template/util/interceptor/network_auth_interceptor.dart'
    as _i1011;
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart'
    as _i481;
import 'package:flutter_template/util/interceptor/network_log_interceptor.dart'
    as _i1069;
import 'package:flutter_template/util/interceptor/network_refresh_interceptor.dart'
    as _i765;
import 'package:flutter_template/util/snackbar/error_util.dart' as _i235;
import 'package:flutter_template/util/theme/theme_config.dart' as _i437;
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i1050;
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i844;
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart' as _i317;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart'
    as _i836;
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart'
    as _i880;
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart' as _i681;
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i527;
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart'
    as _i532;
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart'
    as _i200;
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart'
    as _i772;
import 'package:flutter_template/webservice/todo/todo_dummy_service.dart'
    as _i698;
import 'package:flutter_template/webservice/todo/todo_service.dart' as _i738;
import 'package:flutter_template/webservice/todo/todo_webservice.dart' as _i100;
import 'package:get_it/get_it.dart' as _i174;
import 'package:icapps_architecture/icapps_architecture.dart' as _i556;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.singleton<_i556.ConnectivityHelper>(
        () => registerModule.connectivityHelper());
    await gh.singletonAsync<_i500.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true,
    );
    gh.singleton<_i1069.NetworkLogInterceptor>(
        () => _i1069.NetworkLogInterceptor());
    gh.lazySingleton<_i398.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.storage());
    gh.lazySingleton<_i235.ErrorUtil>(() => _i235.ErrorUtil());
    gh.lazySingleton<_i437.ThemeConfigUtil>(() => _i437.ThemeConfigUtil());
    gh.singleton<_i40.CacheControlling>(() => _i979.CacheController());
    gh.lazySingleton<_i192.FireBaseAnalyticsRepository>(
        () => _i192.FireBaseAnalyticsRepository(gh<_i398.FirebaseAnalytics>()));
    gh.singleton<_i481.NetworkErrorInterceptor>(
        () => _i481.NetworkErrorInterceptor(gh<_i556.ConnectivityHelper>()));
    gh.lazySingleton<_i556.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i460.SharedPreferences>()));
    gh.singleton<_i738.TodoService>(
      () => _i698.TodoDummyService(),
      registerFor: {_dummy},
    );
    gh.lazySingleton<_i587.LocaleRepository>(
        () => _i587.LocaleRepository(gh<_i556.SharedPreferenceStorage>()));
    gh.lazySingleton<_i380.DebugRepository>(
        () => _i380.DebugRepository(gh<_i556.SharedPreferenceStorage>()));
    gh.lazySingleton<_i327.FlutterTemplateDatabase>(() => registerModule
        .provideFlutterTemplateDatabase(gh<_i500.DatabaseConnection>()));
    gh.lazySingleton<_i658.SecureStorage>(
        () => _i658.SecureStorage(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i861.MainNavigator>(
        () => _i861.MainNavigator(gh<_i235.ErrorUtil>()));
    gh.factory<_i880.LicenseViewModel>(
        () => _i880.LicenseViewModel(gh<_i861.MainNavigator>()));
    gh.factory<_i1050.DebugPlatformSelectorViewModel>(
        () => _i1050.DebugPlatformSelectorViewModel(gh<_i861.MainNavigator>()));
    gh.lazySingleton<_i556.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i556.SharedPreferenceStorage>(),
              gh<_i658.SecureStorage>(),
            ));
    gh.lazySingleton<_i559.AuthStorage>(
        () => _i559.AuthStorage(gh<_i556.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i661.TodoDaoStorage>(
        () => _i661.TodoDaoStorage(gh<_i327.FlutterTemplateDatabase>()));
    gh.lazySingleton<_i529.RefreshRepository>(
        () => _i529.RefreshRepository(gh<_i559.AuthStorage>()));
    gh.lazySingleton<_i726.LoginRepository>(
        () => _i726.LoginRepository(gh<_i559.AuthStorage>()));
    gh.lazySingleton<_i855.LocalStorage>(() => _i855.LocalStorage(
          gh<_i559.AuthStorage>(),
          gh<_i556.SharedPreferenceStorage>(),
        ));
    gh.singleton<_i765.NetworkRefreshInterceptor>(
        () => _i765.NetworkRefreshInterceptor(
              gh<_i559.AuthStorage>(),
              gh<_i529.RefreshRepository>(),
            ));
    gh.lazySingleton<_i955.TodoRepository>(() => _i955.TodoRepository(
          gh<_i738.TodoService>(),
          gh<_i661.TodoDaoStorage>(),
        ));
    gh.lazySingleton<_i76.OnboardingNavigator>(() => _i76.OnboardingNavigator(
          gh<_i861.MainNavigator>(),
          gh<_i855.LocalStorage>(),
          gh<_i726.LoginRepository>(),
        ));
    gh.singleton<_i1011.NetworkAuthInterceptor>(
        () => _i1011.NetworkAuthInterceptor(gh<_i559.AuthStorage>()));
    gh.lazySingleton<_i836.GlobalViewModel>(() => _i836.GlobalViewModel(
          gh<_i587.LocaleRepository>(),
          gh<_i380.DebugRepository>(),
          gh<_i855.LocalStorage>(),
          gh<_i437.ThemeConfigUtil>(),
        ));
    gh.factory<_i532.SplashViewModel>(() => _i532.SplashViewModel(
          gh<_i855.LocalStorage>(),
          gh<_i76.OnboardingNavigator>(),
        ));
    gh.factory<_i317.DebugViewModel>(() => _i317.DebugViewModel(
          gh<_i380.DebugRepository>(),
          gh<_i861.MainNavigator>(),
          gh<_i327.FlutterTemplateDatabase>(),
          gh<_i855.LocalStorage>(),
        ));
    gh.factory<_i527.AnalyticsPermissionViewModel>(
        () => _i527.AnalyticsPermissionViewModel(
              gh<_i76.OnboardingNavigator>(),
              gh<_i855.LocalStorage>(),
            ));
    gh.factory<_i772.TodoListViewModel>(() => _i772.TodoListViewModel(
          gh<_i955.TodoRepository>(),
          gh<_i861.MainNavigator>(),
        ));
    gh.factory<_i200.TodoAddViewModel>(() => _i200.TodoAddViewModel(
          gh<_i955.TodoRepository>(),
          gh<_i861.MainNavigator>(),
        ));
    gh.factory<_i844.DebugThemeSelectorViewModel>(
        () => _i844.DebugThemeSelectorViewModel(
              gh<_i861.MainNavigator>(),
              gh<_i836.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i556.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i1069.NetworkLogInterceptor>(),
              gh<_i1011.NetworkAuthInterceptor>(),
              gh<_i481.NetworkErrorInterceptor>(),
              gh<_i765.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i681.LoginViewModel>(() => _i681.LoginViewModel(
          gh<_i726.LoginRepository>(),
          gh<_i861.MainNavigator>(),
          gh<_i76.OnboardingNavigator>(),
        ));
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.provideDio(gh<_i556.CombiningSmartInterceptor>()));
    gh.singleton<_i738.TodoService>(
      () => _i100.TodoWebService(gh<_i361.Dio>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}

class _$RegisterModule extends _i480.RegisterModule {}
