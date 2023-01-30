import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'theme_selector_viewmodel_test.mocks.dart';

@GenerateMocks([
  GlobalViewModel,
  MainNavigator,
])
void main() {
  late DebugThemeSelectorViewModel sut;
  late GlobalViewModel globalViewModel;
  late MainNavigator navigator;

  setUp(() async {
    navigator = MockMainNavigator();
    globalViewModel = MockGlobalViewModel();
    sut = DebugThemeSelectorViewModel(navigator, globalViewModel);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode light', () async {
    when(globalViewModel.updateThemeMode(ThemeMode.light)).thenAnswer((_) => Future.value());
    await sut.updateThemeMode(ThemeMode.light);
    verify(globalViewModel.updateThemeMode(ThemeMode.light)).calledOnce();
  });

  test('DebugThemeSelectorViewmodel updateThemeMode dark', () async {
    when(globalViewModel.updateThemeMode(ThemeMode.dark)).thenAnswer((_) => Future.value());
    await sut.updateThemeMode(ThemeMode.dark);
    verify(globalViewModel.updateThemeMode(ThemeMode.dark)).calledOnce();
  });

  test('DebugThemeSelectorViewmodel updateThemeMode system', () async {
    when(globalViewModel.updateThemeMode(ThemeMode.system)).thenAnswer((_) => Future.value());
    await sut.updateThemeMode(ThemeMode.system);
    verify(globalViewModel.updateThemeMode(ThemeMode.system)).calledOnce();
  });
}
