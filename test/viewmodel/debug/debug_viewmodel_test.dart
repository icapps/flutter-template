import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/repository/debug/mock_debug_repository.dart';
import '../../util/test_extensions.dart';

void main() {
  DebugViewModel sut;
  DebugNavigator navigator;
  MockDebugRepository debugRepo;

  setUp(() async {
    await TestKiwiUtil.init();
    navigator = MockDebugNavigator();
    debugRepo = TestKiwiUtil.resolveAs<DebugRepo, MockDebugRepository>();
    sut = DebugViewModel(debugRepo);
  });

  test('DebugViewModel init', () async {
    await sut.init(navigator);
    verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
    verifyNoMoreInteractions(debugRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      await sut.init(navigator);
      reset(navigator);
      reset(debugRepo);
    });

    test('DebugViewModel onLicensesClicked', () async {
      sut.onSelectLanguageClicked();
      verify(navigator.goToSelectLanguage()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('DebugViewModel onLicensesClicked', () async {
      sut.onLicensesClicked();
      verify(navigator.goToLicenses()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('DebugViewModel onLicensesClicked', () async {
      sut.onTargetPlatformClicked();
      verify(navigator.goToTargetPlatformSelector()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    group('onSlowAnimationsChanged', () {
      test('DebugViewModel onSlowAnimationsChanged with false', () async {
        when(debugRepo.isSlowAnimationsEnabled()).thenAnswer((_) => false);
        await sut.onSlowAnimationsChanged(false);
        verify(debugRepo.saveSlowAnimations(enabled: false)).calledOnce();
        verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
        expect(sut.slowAnimationsEnabled, false);
        verifyZeroInteractions(navigator);
        verifyNoMoreInteractions(debugRepo);
      });
      test('DebugViewModel onSlowAnimationsChanged with true', () async {
        when(debugRepo.isSlowAnimationsEnabled()).thenAnswer((_) => true);
        await sut.onSlowAnimationsChanged(true);
        verify(debugRepo.saveSlowAnimations(enabled: true)).calledOnce();
        verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
        expect(sut.slowAnimationsEnabled, true);
        verifyZeroInteractions(navigator);
        verifyNoMoreInteractions(debugRepo);
      });
    });
  });
}

class MockDebugNavigator extends Mock implements DebugNavigator {}
