import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';
import 'license_screen_test.mocks.dart';

@GenerateMocks([
  LicenseViewModel,
])
void main() {
  late LicenseViewModel licenseViewModel;

  setUp(() async {
    seedLocalStorage();
    licenseViewModel = MockLicenseViewModel();
  });

  testWidgets('Test license screen initial state', (tester) async {
    seedsLicenses();
    seedGlobalViewModel();

    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_inital_state');
    verifyLicenseViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test license screen initial state darkmode', (tester) async {
    seedsLicenses();
    seedGlobalViewModel();

    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_inital_state_dark_mode');
    verifyLicenseViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test license screen empty state', (tester) async {
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
  final licenseViewModel = getIt<LicenseViewModel>();
  verify(licenseViewModel.licenses);
}
