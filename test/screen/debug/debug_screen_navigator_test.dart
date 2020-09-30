import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  GlobalCubit globalCubit;
  setUp(() async {
    await TestKiwiUtil.init();
    globalCubit = TestKiwiUtil.resolveAs<GlobalCubit, MockGlobalCubit>();
    seedGlobalCubitWith();
  });

  testWidgets('Test debug screen on select target clicked', (tester) async {
    final mockNavigation = MockMainNavigation();
    const sut = DebugScreen();
    await TestUtil.loadScreenWithGlobalBloc(tester, sut, globalCubit, mockNavigation);

    await TestUtil.navigateWithButton(tester, Keys.debugTargetPlatform);
    verify(mockNavigation.goToDebugPlatformSelector()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    await TestUtil.navigateWithButton(tester, Keys.debugLicense);
    verify(mockNavigation.goToLicense()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    await TestUtil.navigateWithButton(tester, Keys.debugSelectLanguage);
    verify(mockNavigation.showCustomDialog(builder: anyNamed('builder'))).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
