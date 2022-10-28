import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';
import '../../util/test_themes_util.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  late MockGlobalViewModel globalViewModel;
  late MockDebugPlatformSelectorViewModel platformViewModel;

  setUp(() async {
    await initTestInjectable();
    platformViewModel = getIt.resolveAs<DebugPlatformSelectorViewModel, MockDebugPlatformSelectorViewModel>();
    globalViewModel = getIt.resolveAs<GlobalViewModel, MockGlobalViewModel>();
    seedLocalStorage();
  });

  testWidgets('Test debug select platform screen initial state light mode', (tester) async {
    seedGlobalViewModel();
    TestThemeUtil.setLightMode();

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_inital_state_lightmode');
    verifyGlobalViewModel();
  });

  testWidgets('Test debug select platform screen initial state dark mode', (tester) async {
    seedGlobalViewModel();
    TestThemeUtil.setDarkMode();

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_inital_state_darkmode');
    verifyGlobalViewModel();
  });

  testWidgets('Test debug screen select platform and select correct platform', (tester) async {
    seedGlobalViewModel();
    when(globalViewModel.targetPlatform).thenReturn(TargetPlatform.android);

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_android');

    when(globalViewModel.targetPlatform).thenReturn(TargetPlatform.iOS);
    globalViewModel.notifyListeners();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_ios');

    when(globalViewModel.targetPlatform).thenReturn(null);
    globalViewModel.notifyListeners();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_system');
  });

  group('setCorrectPlatform', () {
    testWidgets('Test debug screen select platform click on system', (tester) async {
      seedGlobalViewModel();
      when(globalViewModel.targetPlatform).thenReturn(null);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);

      const sut = DebugPlatformSelectorScreen();
      await TestUtil.loadScreen(tester, sut);
      reset(platformViewModel);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);

      final target = TextFinder(LocalizationKeys.generalLabelSystemDefault, substring: true);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.setSelectedPlatformToDefault()).calledOnce();
      verifyGlobalViewModel();
    });

    testWidgets('Test debug select platform screen select ios', (tester) async {
      seedGlobalViewModel();
      when(globalViewModel.targetPlatform).thenReturn(TargetPlatform.iOS);

      const sut = DebugPlatformSelectorScreen();
      await TestUtil.loadScreen(tester, sut);
      reset(platformViewModel);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);

      final target = TextFinder(LocalizationKeys.generalLabelIos, substring: true);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.setSelectedPlatformToIOS()).calledOnce();
      verifyGlobalViewModel();
    });

    testWidgets('Test debug select platform  screen select android', (tester) async {
      seedGlobalViewModel();
      when(globalViewModel.targetPlatform).thenReturn(null);

      const sut = DebugPlatformSelectorScreen();
      await TestUtil.loadScreen(tester, sut);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);

      final target = TextFinder(LocalizationKeys.generalLabelAndroid, substring: true);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.setSelectedPlatformToAndroid()).calledOnce();
      verifyGlobalViewModel();
    });
  });

  group('Actions', () {
    testWidgets('Test debug select platform  screen on back clicked', (tester) async {
      seedGlobalViewModel();
      when(globalViewModel.targetPlatform).thenReturn(null);

      const sut = DebugPlatformSelectorScreen();
      await TestUtil.loadScreen(tester, sut);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);
      // ignore: void_checks
      when(platformViewModel.onBackClicked()).thenReturn(1);

      final target = find.byKey(Keys.backButton);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(platformViewModel.onBackClicked()).calledOnce();
    });
  });
}
