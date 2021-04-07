import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/navigator/main_navigation.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/locale/locale_repo.dart';
import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/repository/secure_storage/secure_storing.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storing.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
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
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/test_util.dart';
import 'injectable_test.mocks.dart';
import 'test_injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initTestGetIt',
  generateForDir: ['test'],
)
Future<void> initTestInjectable() async {
  await getIt.reset();
  if (!FlavorConfig.hasInstance) {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.TEST,
      color: Colors.purple,
      name: 'Test',
      values: values,
    );
  }
  TestWidgetsFlutterBinding.ensureInitialized();
  getIt.allowReassignment = true;
  await $initGetIt(getIt, environment: Environments.TEST);
  $initTestGetIt(getIt, environment: Environments.TEST);
  await TestUtil.loadFonts();
}

@module
abstract class RegisterModule {
  @Environment(Environments.TEST)
  @singleton
  FlutterTemplateDatabase get flutterTemplateDatabase => FlutterTemplateDatabase(VmDatabase.memory());

  @singleton
  TodoDaoStoring get getTodoDaoStoring => MockTodoDaoStoring();

  @singleton
  DebugRepo get getDebugRepo => MockDebugRepo();

  @singleton
  LocaleRepo get getLocaleRepo => MockLocaleRepo();

  @singleton
  LoginRepo get getLoginRepo => MockLoginRepo();

  @singleton
  RefreshRepo get getRefreshRepo => MockRefreshRepo();

  @singleton
  SecureStoring get getSecureStoring => MockSecureStoring();

  @singleton
  AuthStoring get getAuthStoring => MockAuthStoring();

  @singleton
  SharedPrefsStoring get getSharedPrefsStoring => MockSharedPrefsStoring();

  @singleton
  LocalStoring get getLocalStoring => MockLocalStoring();

  @singleton
  TodoRepo get getTodoRepo => MockTodoRepo();

  @singleton
  ConnectivityControlling get getConnectivityControlling => MockConnectivityControlling();

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
  MainNavigation get getMainNavigation {
    final navigation = MockMainNavigation();
    when(navigation.showCustomDialog<void>(builder: anyNamed('builder'))).thenAnswer((realInvocation) => 1);
    return navigation;
  }

  static T _initVM<T extends ChangeNotifier>(T viewModel) {
    // ignore: void_checks
    when(viewModel.dispose()).thenReturn(1);
    // ignore: void_checks
    when(viewModel.notifyListeners()).thenReturn(1);
    return viewModel;
  }
}

class MockTodoDaoStoring extends Mock implements TodoDaoStoring {
  @override
  Future<void> createTodoWithValue(Todo? todo) async {
    noSuchMethod(Invocation.method(#createTodoWithValue, [todo]));
  }

  @override
  Stream<List<DbTodo>> getAllTodosStream() {
    // ignore: avoid_as
    return noSuchMethod(Invocation.method(#getAllTodosStream, []), returnValue: Stream.value(<DbTodo>[])) as Stream<List<DbTodo>>;
  }

  @override
  Future<void> createTodo(String todo) async {
    noSuchMethod(Invocation.method(#createTodo, [todo]));
  }

  @override
  Future<void> updateTodo({required int id, required bool completed}) async {
    noSuchMethod(Invocation.method(#updateTodo, [id, completed]));
  }
}
