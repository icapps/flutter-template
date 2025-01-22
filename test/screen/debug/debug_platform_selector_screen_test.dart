import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';
import 'debug_platform_selector_screen_test.mocks.dart';

@GenerateMocks([
  DebugPlatformSelectorViewModel,
])
void main() {
  late MockDebugPlatformSelectorViewModel platformViewModel;

  setUp(() async {
    platformViewModel = MockDebugPlatformSelectorViewModel();
    getIt.registerSingleton<DebugPlatformSelectorViewModel>(platformViewModel);
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('Test debug select platform screen initial state light mode', (tester) async {
    when(platformViewModel.selectedPlatform).thenReturn(TargetPlatform.android);

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_inital_state_lightmode');
    verifyGlobalViewModel();
  });

  testWidgets('Test debug select platform screen initial state dark mode', (tester) async {
    when(platformViewModel.selectedPlatform).thenReturn(TargetPlatform.android);

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut, themeMode: ThemeMode.dark);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_inital_state_darkmode');
    verifyGlobalViewModel();
  });

  testWidgets('Test debug screen select platform and select correct platform', (tester) async {
    when(platformViewModel.selectedPlatform).thenReturn(TargetPlatform.android);

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_android');

    when(platformViewModel.selectedPlatform).thenReturn(TargetPlatform.iOS);
    platformViewModel.notifyListeners();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_ios');

    when(platformViewModel.selectedPlatform).thenReturn(null);
    platformViewModel.notifyListeners();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_system');
  });

  group('setCorrectPlatform', () {
    testWidgets('Test debug screen select platform click on system', (tester) async {
      when(platformViewModel.selectedPlatform).thenReturn(null);
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

      verify(platformViewModel.setSelectedPlatformToDefault()).calledOnce();
      verifyGlobalViewModel();
    });

    testWidgets('Test debug select platform screen select ios', (tester) async {
      when(platformViewModel.selectedPlatform).thenReturn(TargetPlatform.iOS);

      const sut = DebugPlatformSelectorScreen();
      await TestUtil.loadScreen(tester, sut);
      reset(platformViewModel);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);

      final target = TextFinder(LocalizationKeys.generalLabelIos, substring: true);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(platformViewModel.setSelectedPlatformToIOS()).calledOnce();
      verifyGlobalViewModel();
    });

    testWidgets('Test debug select platform  screen select android', (tester) async {
      when(platformViewModel.selectedPlatform).thenReturn(null);

      const sut = DebugPlatformSelectorScreen();
      await TestUtil.loadScreen(tester, sut);
      // ignore: void_checks
      when(platformViewModel.dispose()).thenReturn(1);

      final target = TextFinder(LocalizationKeys.generalLabelAndroid, substring: true);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(platformViewModel.setSelectedPlatformToAndroid()).calledOnce();
      verifyGlobalViewModel();
    });
  });
}
