import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  late DebugViewModel debugViewModel;
  late GlobalViewModel globalViewModel;

  setUp(() async {
    await initTestInjectable();
    debugViewModel = GetIt.I();
    globalViewModel = GetIt.I();
  });

  testWidgets('Test debug screen initial state', (tester) async {
    seedDebugViewModel();
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: const DebugScreen(),
    );
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_inital_state');
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test debug screen on select target clicked', (tester) async {
    seedDebugViewModel();
    seedGlobalViewModel();

    const sut = DebugScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.debugTargetPlatform);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(debugViewModel.onTargetPlatformClicked()).calledOnce();
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test debugscreen on select language clicked', (tester) async {
    seedDebugViewModel();
    seedGlobalViewModel();

    const sut = DebugScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.debugSelectLanguage);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(debugViewModel.onSelectLanguageClicked()).calledOnce();
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test debugscreen on license clicked', (tester) async {
    seedDebugViewModel();
    seedGlobalViewModel();

    const sut = DebugScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.debugLicense);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(debugViewModel.onLicensesClicked()).calledOnce();
    verifyDebugViewModel();
    verifyGlobalViewModelForDebugScreen();
    verifyGlobalViewModel();
  });

  group('Slow Animations', () {
    testWidgets('Test debug screen disable slow animations', (tester) async {
      seedDebugViewModel();
      seedGlobalViewModel();
      when(debugViewModel.slowAnimationsEnabled).thenReturn(true);

      const sut = DebugScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_slow_animations_enabled');

      final target = find.byKey(Keys.debugSlowAnimations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(debugViewModel.onSlowAnimationsChanged(false)).calledOnce();
      verifyDebugViewModel();
      verifyGlobalViewModelForDebugScreen();
      verifyGlobalViewModel();
    });

    testWidgets('Test debug screen enable slow animations', (tester) async {
      seedDebugViewModel();
      seedGlobalViewModel();
      when(debugViewModel.slowAnimationsEnabled).thenReturn(false);

      const sut = DebugScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_slow_animations_disabled');

      final target = find.byKey(Keys.debugSlowAnimations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(debugViewModel.onSlowAnimationsChanged(true)).calledOnce();
      verifyDebugViewModel();
      verifyGlobalViewModelForDebugScreen();
      verifyGlobalViewModel();
    });
  });

  group('Slow localizations', () {
    testWidgets('Test debug screen show localiation keys disable', (tester) async {
      seedDebugViewModel();
      seedGlobalViewModel();
      when(globalViewModel.showsTranslationKeys).thenReturn(true);

      const sut = DebugScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_show_locale_key_enabled');

      final target = find.byKey(Keys.debugShowTranslations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.toggleTranslationKeys()).calledOnce();
      verifyDebugViewModel();
      verifyGlobalViewModelForDebugScreen();
      verifyGlobalViewModel();
    });

    testWidgets('Test debugscreen disable showlocalization keyss', (tester) async {
      seedDebugViewModel();
      seedGlobalViewModel();
      when(globalViewModel.showsTranslationKeys).thenReturn(false);

      const sut = DebugScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_show_locale_key_disabled');

      final target = find.byKey(Keys.debugShowTranslations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.toggleTranslationKeys()).calledOnce();
      verifyDebugViewModel();
      verifyGlobalViewModelForDebugScreen();
      verifyGlobalViewModel();
    });
  });
}

void verifyDebugViewModel() {
  final debugViewModel = GetIt.I.resolveAs<DebugViewModel, MockDebugViewModel>();
  verify(debugViewModel.init(any)).calledOnce();
  verify(debugViewModel.slowAnimationsEnabled);
}

void verifyGlobalViewModelForDebugScreen() {
  final globalViewModel = GetIt.I<GlobalViewModel>();
  verify(globalViewModel.showsTranslationKeys);
  verify(globalViewModel.getCurrentLanguage());
  verify(globalViewModel.getCurrentPlatform());
}
