import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late DebugViewModel sut;
  late DebugNavigator navigator;
  late DebugRepo debugRepo;

  setUp(() async {
    await initTestInjectable();
    navigator = MockDebugNavigator();
    debugRepo = GetIt.I();
    sut = DebugViewModel(debugRepo);
  });

  test('DebugViewModel init', () async {
    when(debugRepo.isSlowAnimationsEnabled()).thenReturn(true);
    await sut.init(navigator);
    verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
    verifyNoMoreInteractions(debugRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      when(debugRepo.isSlowAnimationsEnabled()).thenReturn(true);
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
