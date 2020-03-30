import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/viewmodel/debug/mock_debug_platform_selector_viewmodel.dart';
import '../../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockDebugPlatformSelectorViewModel platformViewmodel;
  MockGlobalViewModel globalViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    platformViewmodel = TestKiwiUtil.resolveAs<DebugPlatformSelectorViewModel, MockDebugPlatformSelectorViewModel>();
    globalViewModel = TestKiwiUtil.resolveAs<GlobalViewModel, MockGlobalViewModel>();
  });

  testWidgets('Test debug select platform screen select ios', (tester) async {
    seedGlobalViewModel();
    when(globalViewModel.targetPlatform).thenReturn(TargetPlatform.iOS);

    const sut = DebugPlatformSelectorScreen();
    await TestUtil.loadScreen(tester, sut);
    reset(platformViewmodel);

    final target = find.text(LocalizationKeys.generalLabelIos);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(globalViewModel.setSelectedPlatformToIOS()).calledOnce();
    verifyZeroInteractions(platformViewmodel);
    verifyGlobalViewModel();
  });
}
