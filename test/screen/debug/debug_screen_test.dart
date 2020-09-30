import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/bloc/mock_blocs.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  GlobalCubit globalCubit;

  setUp(() async {
    await TestKiwiUtil.init();
    globalCubit = TestKiwiUtil.resolveAs<GlobalCubit, MockGlobalCubit>();
    seedGlobalCubitWith();
  });

  testWidgets('Test debug screen initial state', (tester) async {
    final mockNavigation = MockMainNavigation();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: const DebugScreen(),
    );
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_inital_state');
  });

  testWidgets('Test debug screen on select target clicked', (tester) async {
    const sut = DebugScreen();
    final mockNavigation = MockMainNavigation();
    await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

    final target = find.byKey(Keys.debugTargetPlatform);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(mockNavigation.goToDebugPlatformSelector()).calledOnce();
  });

  testWidgets('Test debugscreen on select language clicked', (tester) async {
    const sut = DebugScreen();
    final mockNavigation = MockMainNavigation();
    await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

    final target = find.byKey(Keys.debugSelectLanguage);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(mockNavigation.showCustomDialog(builder: anyNamed('builder'))).calledOnce();
  });

  testWidgets('Test debugscreen on license clicked', (tester) async {
    const sut = DebugScreen();
    final mockNavigation = MockMainNavigation();
    await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

    final target = find.byKey(Keys.debugLicense);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(mockNavigation.goToLicense()).calledOnce();
  });

  group('Slow Animations', () {
    testWidgets('Test debug screen disable slow animations', (tester) async {
      seedGlobalCubitWith(slowAnimationsEnabled: true);

      const sut = DebugScreen();
      final mockNavigation = MockMainNavigation();
      final testWidget = await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_slow_animations_enabled');

      final target = find.byKey(Keys.debugSlowAnimations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.changeSlowAnimations(enabled: false)).calledOnce();
    });

    testWidgets('Test debug screen enable slow animations', (tester) async {
      const sut = DebugScreen();
      final mockNavigation = MockMainNavigation();
      final testWidget = await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_slow_animations_disabled');

      final target = find.byKey(Keys.debugSlowAnimations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.changeSlowAnimations(enabled: true)).calledOnce();
    });
  });

  group('Slow localizations', () {
    testWidgets('Test debug screen show localiation keys disable', (tester) async {
      seedGlobalCubitWith(showsTranslationKeys: true);

      const sut = DebugScreen();
      final mockNavigation = MockMainNavigation();
      final testWidget = await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_show_locale_key_enabled');

      final target = find.byKey(Keys.debugShowTranslations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.toggleTranslationKeys()).calledOnce();
    });

    testWidgets('Test debugscreen disable showlocalization keyss', (tester) async {
      const sut = DebugScreen();
      final mockNavigation = MockMainNavigation();
      final testWidget = await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_show_locale_key_disabled');

      final target = find.byKey(Keys.debugShowTranslations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.toggleTranslationKeys()).calledOnce();
    });
  });
}
