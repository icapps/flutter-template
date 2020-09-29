import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/bloc/mock_blocs.dart';
import '../../util/mock_function.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockGlobalCubit globalCubit;

  setUp(() async {
    await TestKiwiUtil.init();
    globalCubit = TestKiwiUtil.resolveAs<GlobalCubit, MockGlobalCubit>();
  });

  testWidgets('Test debug select platform screen initial state', (tester) async {
    seedGlobalCubitWith();
    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_inital_state');
  });

  testWidgets('Test debug screen select platform and select correct platform', (tester) async {
    seedGlobalCubitWith(targetPlatform: TargetPlatform.android);

    const sut = DebugPlatformSelectorScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_android');

    seedGlobalCubitWith(targetPlatform: TargetPlatform.iOS);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_ios');

    seedGlobalCubitWith(targetPlatform: null);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_platform_selector_screen_selected_system');
  });

  group('setCorrectPlatform', () {
    testWidgets('Test debug screen select platform click on system', (tester) async {
      seedGlobalCubitWith(targetPlatform: null);

      final sut = BlocProvider(
        create: (_) => globalCubit,
        child: const DebugPlatformSelectorScreen(),
      );
      await TestUtil.loadScreen(tester, sut);

      final target = find.text(LocalizationKeys.generalLabelSystemDefault);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.changePlatformToDefault()).calledOnce();
      // verifyZeroInteractions(globalCubit); <- Problem, bloc is called async so the events are still going on
    });

    testWidgets('Test debug select platform screen select ios', (tester) async {
      seedGlobalCubitWith(targetPlatform: TargetPlatform.iOS);

      final sut = BlocProvider(
        create: (_) => globalCubit,
        child: const DebugPlatformSelectorScreen(),
      );
      await TestUtil.loadScreen(tester, sut);

      final target = find.text(LocalizationKeys.generalLabelIos);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.changePlatformToIos()).calledOnce();
    });

    testWidgets('Test debug select platform  screen select android', (tester) async {
      seedGlobalCubitWith(targetPlatform: null);

      final sut = BlocProvider(
        create: (_) => globalCubit,
        child: const DebugPlatformSelectorScreen(),
      );
      await TestUtil.loadScreen(tester, sut);

      final target = find.text(LocalizationKeys.generalLabelAndroid);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalCubit.changePlatformToAndroid()).calledOnce();
    });
  });

  group('Actions', () {
    testWidgets('Test debug select platform  screen on back clicked', (tester) async {
      seedGlobalCubitWith(targetPlatform: null);

      final overrideGoBack = MockFunction();
      final widget = DebugPlatformSelectorScreen(overrideGoBack: overrideGoBack);
      final sut = BlocProvider(
        create: (_) => globalCubit,
        child: widget,
      );
      await TestUtil.loadScreen(tester, sut);

      final target = find.byKey(Keys.backButton);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(overrideGoBack()).calledOnce();
    });
  });
}
