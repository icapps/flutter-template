import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/viewmodel/license/mock_lisence_viewmodel.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {

  setUp(() async {
    await TestKiwiUtil.init();
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
}

void seedsLicenses() {
  final licenseViewModel = TestKiwiUtil.resolveAs<LicenseViewModel, MockLicenseViewModel>();
  when(licenseViewModel.licenses).thenReturn([
    for (var i = 0; i < 100; ++i)
      License(
        name: 'name$i',
        version: 'version$i',
        url: 'url$i',
        license: 'license$i',
        licenseUrl: 'licenseUrl$i',
      ),
  ]);
}

void verifyLicenseViewModel() {
  final licenseViewModel = TestKiwiUtil.resolveAs<LicenseViewModel, MockLicenseViewModel>();
  verify(licenseViewModel.licenses);
  verify(licenseViewModel.init(any)).calledOnce();
  verifyNoMoreInteractions(licenseViewModel);
}
