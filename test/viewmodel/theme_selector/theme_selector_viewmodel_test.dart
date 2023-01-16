import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';

void main() {
  late DebugThemeSelectorViewModel sut;
  late GlobalViewModel globalViewModel;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    navigator = MockMainNavigator();
    globalViewModel = MockGlobalViewModel();
    sut = DebugThemeSelectorViewModel(navigator, globalViewModel);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode light', () async {
    await sut.updateThemeMode(ThemeMode.light);
    expect(sut.themeMode, ThemeMode.light);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode dark', () async {
    await sut.updateThemeMode(ThemeMode.dark);
    expect(sut.themeMode, ThemeMode.dark);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode system', () async {
    await sut.updateThemeMode(ThemeMode.system);
    expect(sut.themeMode, ThemeMode.system);
  });
}
