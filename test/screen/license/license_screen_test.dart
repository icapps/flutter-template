import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  late LicenseViewModel licenseViewModel;

  setUp(() async {
    await initTestInjectable();
    licenseViewModel = GetIt.I();
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
  final licenseViewModel = GetIt.I.resolveAs<LicenseViewModel, MockLicenseViewModel>();
  verify(licenseViewModel.licenses);
  verify(licenseViewModel.init(any)).calledOnce();
}
