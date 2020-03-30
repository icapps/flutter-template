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
import 'license_screen_test.dart';

void main() {
  MockLicenseViewModel licenseViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    licenseViewModel = TestKiwiUtil.resolveAs<LicenseViewModel, MockLicenseViewModel>();
  });

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
}
