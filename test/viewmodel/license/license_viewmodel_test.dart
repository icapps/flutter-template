import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../util/test_extensions.dart';

void main() {
  LicenseViewModel sut;
  LicenseNavigator navigator;

  setUp(() async {
    await TestKiwiUtil.init();
    navigator = MockLicenseNavigator();
    sut = LicenseViewModel();
  });

  test('LicenseViewModel init', () async {
    await sut.init(navigator);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      await sut.init(navigator);
      reset(navigator);
    });

    test('LicenseViewModel onBackClicked', () async {
      sut.onBackClicked();
      verify(navigator.goBack<void>()).calledOnce();
      verifyNoMoreInteractions(navigator);
    });

    test('LicenseViewModel licenses', () async {
      expect(sut.licenses.length, LicenseUtil.getLicenses().length);
      verifyZeroInteractions(navigator);
    });
  });
}

class MockLicenseNavigator extends Mock implements LicenseNavigator {}
