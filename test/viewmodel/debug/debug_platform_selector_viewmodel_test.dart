import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../di/injectable_test.mocks.dart';
import '../../util/test_extensions.dart';

void main() {
  late DebugPlatformSelectorViewModel sut;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    navigator = MockMainNavigator();
    sut = DebugPlatformSelectorViewModel(navigator);
  });

  group('After init', () {
    setUp(() async {
      reset(navigator);
    });

    test('DebugPlatformSelectorViewModel onBackClicked', () async {
      sut.onBackClicked();
      verify(navigator.goBack<void>()).calledOnce();
      verifyNoMoreInteractions(navigator);
    });
  });
}
