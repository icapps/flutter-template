import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../util/test_extensions.dart';

void main() {
  DebugPlatformSelectorViewModel sut;
  DebugPlatformSelectorNavigator navigator;

  setUp(() async {
    await TestKiwiUtil.init();
    navigator = MockDebugPlatformSelectorNavigator();
    sut = DebugPlatformSelectorViewModel();
  });

  test('DebugPlatformSelectorViewModel init', () async {
    await sut.init(navigator);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      await sut.init(navigator);
      reset(navigator);
    });

    test('DebugPlatformSelectorViewModel onBackClicked', () async {
      sut.onBackClicked();
      verify(navigator.goBack<void>()).calledOnce();
      verifyNoMoreInteractions(navigator);
    });
  });
}

class MockDebugPlatformSelectorNavigator extends Mock implements DebugPlatformSelectorNavigator {}
