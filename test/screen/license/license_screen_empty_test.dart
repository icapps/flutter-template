import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/viewmodel/license/mock_lisence_viewmodel.dart';
import '../../util/test_util.dart';
import '../seed.dart';
import 'license_screen_test.dart';

void main() {
  MockLicenseViewModel licenseViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    licenseViewModel = TestKiwiUtil.resolveAs<LicenseViewModel, MockLicenseViewModel>();
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
}
