import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'license_viewmodel_test.mocks.dart';

@GenerateMocks([
  MainNavigator,
])
void main() {
  late LicenseViewModel sut;
  late MainNavigator navigator;

  setUp(() async {
    navigator = MockMainNavigator();
    sut = LicenseViewModel(navigator);
  });

  group('After init', () {
    setUp(() async {
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
