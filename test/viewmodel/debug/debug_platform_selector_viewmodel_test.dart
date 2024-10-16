import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'debug_platform_selector_viewmodel_test.mocks.dart';

@GenerateMocks([
  MainNavigator,
  GlobalViewModel,
])
void main() {
  late DebugPlatformSelectorViewModel sut;
  late MainNavigator navigator;
  late MockGlobalViewModel globalViewModel;

  setUp(() async {
    navigator = MockMainNavigator();
    globalViewModel = MockGlobalViewModel();
    sut = DebugPlatformSelectorViewModel(
      globalViewModel,
      navigator,
    );
  });

  group('After init', () {
    setUp(() async {
      reset(navigator);
    });

    test('DebugPlatformSelectorViewModel onBackClicked', () async {
      sut.onBackClicked();
      verify(navigator.goBack()).calledOnce();
      verifyNoMoreInteractions(navigator);
    });
  });
}
