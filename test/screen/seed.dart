import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../di/test_kiwi_util.dart';
import '../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../util/test_extensions.dart';

void seedGlobalViewModel() {
  final globalViewModel = TestKiwiUtil.resolveAs<GlobalViewModel, MockGlobalViewModel>();
  when(globalViewModel.targetPlatform).thenAnswer((_) => TargetPlatform.android);
  when(globalViewModel.showsTranslationKeys).thenAnswer((_) => false);
  when(globalViewModel.localeDelegate).thenAnswer((_) => LocalizationDelegate(newLocale: const Locale('en'), isInTest: true));
  when(globalViewModel.locale).thenAnswer((_) => const Locale('en'));
  when(globalViewModel.themeMode).thenAnswer((_) => ThemeMode.system);
}

void verifyGlobalViewModel() {
  final globalViewModel = TestKiwiUtil.resolveAs<GlobalViewModel, MockGlobalViewModel>();
  verify(globalViewModel.targetPlatform);
  verify(globalViewModel.localeDelegate);
  verify(globalViewModel.locale);
  verify(globalViewModel.themeMode);
  verify(globalViewModel.init()).calledOnce();
  verifyNoMoreInteractions(globalViewModel);
}
