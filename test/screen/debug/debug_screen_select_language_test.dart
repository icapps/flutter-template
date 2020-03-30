import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../mocks/viewmodel/debug/mock_debug_viewmodel.dart';
import '../../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';
import 'debug_screen_slow_animations_true_test.dart';
import 'debug_screen_test.dart';

void main() {
  MockDebugViewModel debugViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    debugViewModel = TestKiwiUtil.resolveAs<DebugViewModel, MockDebugViewModel>();
  });

  testWidgets('Test debugscreen on select language clicked', (tester) async {
    when(debugViewModel.slowAnimationsEnabled).thenReturn(true);
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
}
