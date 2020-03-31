import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test license screen navigator', (tester) async {
    seedLoginViewModel();
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final debugKey = GlobalKey<LoginScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: LoginScreen(key: debugKey),
    );
    await TestUtil.loadScreen(tester, sut);

    debugKey.currentState.goToHome();
    verify(mockNavigation.goToHome()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    final key = debugKey.currentState.getScaffoldState();
    expect(key, isNotNull);
    verifyNoMoreInteractions(mockNavigation);
  });
}
