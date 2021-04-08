import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_injectable.dart';

@GenerateMocks([
  DebugRepo,
  LocaleRepo,
  LoginRepo,
  RefreshRepo,
  SecureStoring,
  AuthStoring,
  SharedPrefsStoring,
  LocalStoring,
  TodoRepo,
  Connectivity,
  FlutterSecureStorage,
  SharedPreferences,
  Dio,
  TodoService,
  DebugPlatformSelectorViewModel,
  DebugViewModel,
  GlobalViewModel,
  LicenseViewModel,
  LoginViewModel,
  SplashViewModel,
  TodoAddViewModel,
  TodoListViewModel,
], customMocks: [
  MockSpec<MainNavigation>(returnNullOnMissingStub: true),
])
void main() {
  setUp(() async => initTestInjectable());

  test('KiwiContainer', () async {
    final loginRepo = GetIt.I<LoginRepo>();
    expect(loginRepo is LoginRepo, true);
  });
}
