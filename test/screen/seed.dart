import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../util/test_extensions.dart';

void seedDebugViewModel() {
  final debugViewModel = GetIt.I<DebugViewModel>();
  when(debugViewModel.slowAnimationsEnabled).thenReturn(false);
}

void seedTodoListViewModel() {
  final todoListViewModel = GetIt.I<TodoListViewModel>();
  when(todoListViewModel.dataStream).thenAnswer((_) => Stream.value([
        for (var i = 0; i < 100; ++i) Todo(id: i, title: 'title $i', completed: false),
      ]));
  when(todoListViewModel.isLoading).thenReturn(false);
  when(todoListViewModel.errorKey).thenReturn(null);
}

void seedTodoAddViewModel() {
  final todoAddViewModel = GetIt.I<TodoAddViewModel>();
  when(todoAddViewModel.isSaveEnabled).thenReturn(false);
}

void seedsLicenses() {
  final licenseViewModel = GetIt.I<LicenseViewModel>();
  when(licenseViewModel.licenses).thenReturn([
    for (var i = 0; i < 100; ++i)
      License(
        name: 'name$i',
        version: 'version$i',
        url: 'url$i',
        license: 'license$i',
        licenseUrl: 'licenseUrl$i',
      ),
  ]);
}

void seedLoginViewModel() {
  final loginViewModel = GetIt.I<LoginViewModel>();
  when(loginViewModel.isLoading).thenReturn(false);
  when(loginViewModel.isLoginEnabled).thenReturn(true);
}

void seedGlobalViewModel() {
  final globalViewModel = GetIt.I<GlobalViewModel>();
  when(globalViewModel.targetPlatform).thenAnswer((_) => TargetPlatform.android);
  when(globalViewModel.showsTranslationKeys).thenAnswer((_) => false);
  when(globalViewModel.localeDelegate).thenAnswer((_) => LocalizationDelegate(newLocale: const Locale('en'), showLocalizationKeys: true));
  when(globalViewModel.locale).thenAnswer((_) => const Locale('en'));
  when(globalViewModel.themeMode).thenAnswer((_) => ThemeMode.system);
}

void verifyGlobalViewModel() {
  final globalViewModel = GetIt.I<GlobalViewModel>();
  verify(globalViewModel.targetPlatform);
  verify(globalViewModel.localeDelegate);
  verify(globalViewModel.locale);
  verify(globalViewModel.themeMode);
  verify(globalViewModel.init()).calledOnce();
  verifyNoMoreInteractions(globalViewModel);
}
