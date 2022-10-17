import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storage.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:flutter_template/repository/login/login_repository.dart';
import 'package:flutter_template/repository/refresh/refresh_repository.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/repository/secure_storage/secure_storage.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mocks/database/todo/mock_todo_dao_storage.dart';
import '../util/test_util.dart';
import 'injectable_test.mocks.dart';
import 'test_injectable.config.dart';

L getLocale<L>(BuildContext context) => Localization as L;

T getTheme<T>(BuildContext context) => GetIt.I<FlutterTemplateTheme>() as T; // ignore: avoid_as

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initTestGetIt',
  generateForDir: ['test'],
)
Future<void> initTestInjectable() async {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  localizationLookup = getLocale;
  themeLookup = getTheme;
  await getIt.reset();
  if (!FlavorConfig.hasInstance) {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.test,
      color: Colors.purple,
      name: 'Test',
      values: values,
      supportsTheming: false,
    );
  }
  TestWidgetsFlutterBinding.ensureInitialized();
  getIt.allowReassignment = true;
  await $initGetIt(getIt, environment: Environments.test);
  $initTestGetIt(getIt, environment: Environments.test);
  await TestUtil.loadFonts();
}

@module
abstract class RegisterModule {
  @Environment(Environments.test)
  @singleton
  FlutterTemplateDatabase get flutterTemplateDatabase => FlutterTemplateDatabase(NativeDatabase.memory());

  @Environment(Environments.test)
  @singleton
  MainNavigator get getMainNavigator => MockMainNavigator();

  @singleton
  FirebaseAnalytics get getFirebaseAnalytics => MockFirebaseAnalytics();

  @singleton
  TodoDaoStorage get getTodoDaoStoring => MockTodoDaoStorage();

  @singleton
  DebugRepository get getDebugRepo => MockDebugRepository();

  @singleton
  LocaleRepository get getLocaleRepo => MockLocaleRepository();

  @singleton
  LoginRepository get getLoginRepo => MockLoginRepository();

  @singleton
  RefreshRepository get getRefreshRepo => MockRefreshRepository();

  @singleton
  SecureStorage get getSecureStoring => MockSecureStorage();

  @singleton
  AuthStorage get getAuthStoring => MockAuthStorage();

  @singleton
  SharedPreferenceStorage get getSharedPrefsStoring => MockSharedPreferenceStorage();

  @singleton
  LocalStorage get getLocalStoring => MockLocalStorage();

  @singleton
  TodoRepository get getTodoRepo => MockTodoRepository();

  @singleton
  ConnectivityHelper get getConnectivityControlling => ConnectivityHelper(connectivityProvider: () => MockConnectivity());

  @singleton
  FlutterSecureStorage get getFlutterSecureStorage => MockFlutterSecureStorage();

  @singleton
  SharedPreferences get getSharedPreferences => MockSharedPreferences();

  @singleton
  Dio get getDio => MockDio();

  @singleton
  TodoService get getTodoService => MockTodoService();

  @singleton
  DebugPlatformSelectorViewModel get getDebugPlatformSelectorViewModel => _initVM(MockDebugPlatformSelectorViewModel());

  @singleton
  DebugViewModel get getDebugViewModel => _initVM(MockDebugViewModel());

  @singleton
  GlobalViewModel get getGlobalViewModel => _initVM(MockGlobalViewModel());

  @singleton
  LicenseViewModel get getLicenseViewModel => _initVM(MockLicenseViewModel());

  @singleton
  LoginViewModel get getLoginViewModel => _initVM(MockLoginViewModel());

  @singleton
  SplashViewModel get getSplashViewModel => _initVM(MockSplashViewModel());

  @singleton
  TodoAddViewModel get getTodoAddViewModel => _initVM(MockTodoAddViewModel());

  @singleton
  TodoListViewModel get getTodoListViewModel => _initVM(MockTodoListViewModel());

  @singleton
  Localization get getLocalization => Localization();

  static T _initVM<T extends ChangeNotifier>(T viewModel) {
    // ignore: void_checks
    when(viewModel.dispose()).thenReturn(1);
    // ignore: void_checks
    when(viewModel.notifyListeners()).thenReturn(1);
    return viewModel;
  }
}

extension GetItExtension on GetIt {
  MockT resolveAs<T extends Object, MockT extends T>() {
    // ignore: avoid_as
    return get<T>() as MockT;
  }
}
