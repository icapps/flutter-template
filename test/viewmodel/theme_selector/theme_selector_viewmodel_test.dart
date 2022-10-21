import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';

void main() {
  late DebugThemeSelectorViewmodel sut;
  late LocalStorage localStorage;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    localStorage = getIt();
    navigator = MockMainNavigator();
    sut = DebugThemeSelectorViewmodel(navigator, localStorage);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode light', () async {
    when(localStorage.getThemeMode()).thenAnswer((_) => ThemeMode.system);
    await sut.updateThemeMode(ThemeMode.light);
    expect(sut.themeMode, ThemeMode.light);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode dark', () async {
    when(localStorage.getThemeMode()).thenAnswer((_) => ThemeMode.system);
    await sut.updateThemeMode(ThemeMode.dark);
    expect(sut.themeMode, ThemeMode.dark);
  });

  test('DebugThemeSelectorViewmodel updateThemeMode system', () async {
    when(localStorage.getThemeMode()).thenAnswer((_) => ThemeMode.dark);
    await sut.updateThemeMode(ThemeMode.system);
    expect(sut.themeMode, ThemeMode.system);
  });
}
