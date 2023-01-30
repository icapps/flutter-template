import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../util/test_extensions.dart';

void seedDebugViewModel() {
  final viewModel = getIt<DebugViewModel>();
  when(viewModel.slowAnimationsEnabled).thenReturn(false);
  when(viewModel.onTargetPlatformClicked()).thenAnswer((realInvocation) {});
  when(viewModel.onSelectLanguageClicked()).thenAnswer((realInvocation) {});
  when(viewModel.onLicensesClicked()).thenAnswer((realInvocation) {});
}

void seedTodoListViewModel() {
  final viewModel = getIt<TodoListViewModel>();
  when(viewModel.dataStream).thenAnswer((_) => Stream.value([
        for (var i = 0; i < 100; ++i) Todo(id: i, title: 'title $i', completed: false),
      ]));
  when(viewModel.isLoading).thenReturn(false);
  when(viewModel.errorKey).thenReturn(null);
  when(viewModel.onAddClicked()).thenAnswer((realInvocation) {});
}

void seedTodoAddViewModel() {
  final viewModel = getIt<TodoAddViewModel>();
  when(viewModel.isSaveEnabled).thenReturn(false);
  when(viewModel.onBackClicked()).thenAnswer((realInvocation) {});
}

void seedsLicenses() {
  final viewModel = getIt<LicenseViewModel>();
  when(viewModel.onBackClicked()).thenAnswer((realInvocation) {});
  when(viewModel.licenses).thenReturn([
    for (var i = 0; i < 100; ++i)
      License(
        name: 'name$i',
        version: 'version$i',
        homepage: 'homepage$i',
        license: 'license$i',
        repository: 'repository$i',
      ),
  ]);
}

void seedLoginViewModel() {
  final viewModel = getIt<LoginViewModel>();
  when(viewModel.isLoading).thenReturn(false);
  when(viewModel.isLoginEnabled).thenReturn(true);
}

void seedGlobalViewModel() {
  final viewModel = getIt<GlobalViewModel>();
  when(viewModel.targetPlatform).thenAnswer((_) => TargetPlatform.android);
  when(viewModel.showsTranslationKeys).thenAnswer((_) => false);
  when(viewModel.locale).thenAnswer((_) => const Locale('en'));
  when(viewModel.themeMode).thenAnswer((_) => ThemeMode.system);
  when(viewModel.getCurrentPlatform()).thenReturn(LocalizationKeys.generalLabelAndroid);
  when(viewModel.getCurrentLanguage()).thenReturn('English');
  when(viewModel.localeDelegate).thenReturn(LocalizationDelegate());
  when(viewModel.supportedLocales).thenReturn(const [Locale('en'), Locale('nl')]);
  when(viewModel.dispose()).thenAnswer((realInvocation) {});
}

void verifyGlobalViewModel() {
  final viewModel = getIt<GlobalViewModel>();
  verify(viewModel.targetPlatform);
  verify(viewModel.locale);
  verify(viewModel.themeMode);
  verify(viewModel.init()).calledOnce();
}

void seedAuthStorage() {
  final authStorage = getIt<AuthStorage>();
  when(authStorage.getAccessToken()).thenAnswer((_) => Future.value('accessToken'));
  when(authStorage.getRefreshToken()).thenAnswer((_) => Future.value('refreshToken'));
  when(authStorage.isLoggedIn).thenReturn(true);
}

void seedLocalStorage() {
  final localStorage = getIt<LocalStorage>();
  when(localStorage.getThemeMode()).thenReturn(ThemeMode.system);
}
