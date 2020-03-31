import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/viewmodel/login/mock_login_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockLoginViewModel loginViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    loginViewModel = TestKiwiUtil.resolveAs<LoginViewModel, MockLoginViewModel>();
    seedLoginViewModel();
    seedGlobalViewModel();
  });

  testWidgets('Test login screen initial state', (tester) async {

    const sut = LoginScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'login_screen_inital_state');
    verifyLoginViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test login screen disabled button state', (tester) async {
    when(loginViewModel.isLoginEnabled).thenReturn(false);

    const sut = LoginScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'login_screen_login_button_disabled');
    verifyGlobalViewModel();
  });

  group('Actions', () {

    testWidgets('Test todo add screen button disabled on save clicked', (tester) async {
      const sut = LoginScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byType(FlutterTemplateButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(loginViewModel.onLoginClicked()).calledOnce();
      verifyLoginViewModel();
      verifyGlobalViewModel();
    });

    testWidgets('Test login screen shod have  add screen button disabled on back clicked', (tester) async {
      when(loginViewModel.isLoginEnabled).thenReturn(false);

      const sut = LoginScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byType(FlutterTemplateButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verifyLoginViewModel();
      verifyGlobalViewModel();
    });

    testWidgets('Test login screen should have an email input field', (tester) async {
      const sut = LoginScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byKey(Keys.emailInput);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      await tester.enterText(finder, 'test');

      verify(loginViewModel.onEmailUpdated('test')).calledOnce();
      verifyLoginViewModel();
      verifyGlobalViewModel();
    });

    testWidgets('Test login screen should have an password input field', (tester) async {
      const sut = LoginScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byKey(Keys.passwordInput);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      await tester.enterText(finder, 'test');

      verify(loginViewModel.onPasswordUpdated('test')).calledOnce();
      verifyLoginViewModel();
      verifyGlobalViewModel();
    });
  });
}

void verifyLoginViewModel() {
  final loginViewModel = TestKiwiUtil.resolveAs<LoginViewModel, MockLoginViewModel>();
  verify(loginViewModel.isLoading);
  verify(loginViewModel.isLoginEnabled);
  verify(loginViewModel.init(any)).calledOnce();
  verifyNoMoreInteractions(loginViewModel);
}
