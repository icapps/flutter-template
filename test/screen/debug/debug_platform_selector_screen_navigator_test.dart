import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
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
  late GlobalViewModel globalViewModel;

  setUp(() async {
    await initTestInjectable();
    globalViewModel = GetIt.I();
  });

  testWidgets('Test debug select platform screen navigator test', (tester) async {
    seedGlobalViewModel();
    when(globalViewModel.targetPlatform).thenReturn(TargetPlatform.iOS);

    final mockNavigation = MockMainNavigation();
    final key = GlobalKey<DebugPlatformSelectorScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: DebugPlatformSelectorScreen(key: key),
    );
    await TestUtil.loadScreen(tester, sut);
    reset(globalViewModel);
    // ignore: void_checks
    when(globalViewModel.dispose()).thenReturn(1);

    key.currentState!.goBack<void>();
    verify(mockNavigation.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    key.currentState!.goBack(result: 'test');
    verify(mockNavigation.goBack(result: 'test')).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
