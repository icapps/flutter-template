import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
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
  GlobalViewModel,
])
void main() {
  late LicenseViewModel licenseViewModel;
  late GlobalViewModel globalViewModel;

  setUp(() async {
    licenseViewModel = MockLicenseViewModel();
    globalViewModel = MockGlobalViewModel();
    getIt.registerLazySingleton<LicenseViewModel>(() => licenseViewModel);
    getIt.registerLazySingleton<GlobalViewModel>(() => globalViewModel);
    seedsLicenses();
    seedGlobalViewModel();
  });

  tearDown(() {
    verifyLicenseViewModel();
    verifyGlobalViewModel();
    getIt.reset();
  });

  testWidgets('Test license screen initial state', (tester) async {
    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_inital_state');
  });

  testWidgets('Test license screen initial state darkmode', (tester) async {
    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut, themeMode: ThemeMode.dark);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_inital_state_dark_mode');
  });

  testWidgets('Test license screen empty state', (tester) async {
    when(licenseViewModel.licenses).thenReturn([]);
    const sut = LicenseScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'license_screen_empty_list');
  });

  group('Actions', () {
    testWidgets('Test license screen on back clicked', (tester) async {
      const sut = LicenseScreen();
      await TestUtil.loadScreen(tester, sut);

      final target = find.byKey(Keys.backButton);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();
      verify(licenseViewModel.onBackClicked()).calledOnce();
    });
  });
}

void verifyLicenseViewModel() {
  final licenseViewModel = getIt<LicenseViewModel>();
  verify(licenseViewModel.licenses);
}
