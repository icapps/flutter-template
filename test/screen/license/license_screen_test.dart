import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/viewmodel/license/mock_lisence_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  MockLicenseViewModel licenseViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    licenseViewModel = TestKiwiUtil.resolveAs<LicenseViewModel, MockLicenseViewModel>();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    seedsLicenses();
    seedGlobalViewModel();

    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_inital_state');
    verifyLicenseViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    when(licenseViewModel.licenses).thenReturn([]);
    seedGlobalViewModel();

    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_empty_list');
    verifyLicenseViewModel();
    verifyGlobalViewModel();
  });

  group('Actions', () {
    testWidgets('Test license screen on back clicked', (tester) async {
      seedsLicenses();
      seedGlobalViewModel();

      const sut = LicenseScreen();
      await TestUtil.loadScreen(tester, sut);

      final target = find.byKey(Keys.backButton);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(licenseViewModel.onBackClicked()).calledOnce();
      verifyLicenseViewModel();
      verifyGlobalViewModel();
    });
  });
}

void verifyLicenseViewModel() {
  final licenseViewModel = TestKiwiUtil.resolveAs<LicenseViewModel, MockLicenseViewModel>();
  verify(licenseViewModel.licenses);
  verify(licenseViewModel.init(any)).calledOnce();
  verifyNoMoreInteractions(licenseViewModel);
}
