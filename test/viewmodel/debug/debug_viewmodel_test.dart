import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import 'debug_viewmodel_test.mocks.dart';

@GenerateMocks([
  MainNavigator,
  DebugRepository,
  LocalStorage,
  FlutterTemplateDatabase,
])
void main() {
  late DebugViewModel sut;
  late MainNavigator navigator;
  late DebugRepository debugRepo;
  late LocalStorage localStorage;
  late FlutterTemplateDatabase database;

  setUp(() async {
    navigator = MockMainNavigator();
    debugRepo = MockDebugRepository();
    localStorage = MockLocalStorage();
    database = MockFlutterTemplateDatabase();
    sut = DebugViewModel(debugRepo, navigator, database, localStorage);
  });

  test('DebugViewModel init', () async {
    when(debugRepo.isSlowAnimationsEnabled()).thenReturn(true);
    await sut.init();
    verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
    verifyNoMoreInteractions(debugRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      when(debugRepo.isSlowAnimationsEnabled()).thenReturn(true);
      await sut.init();
      reset(navigator);
      reset(debugRepo);
    });

    test('DebugViewModel onLicensesClicked', () async {
      sut.onSelectLanguageClicked();
      verify(navigator.showCustomDialog<void>(widget: anyNamed('widget'))).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('DebugViewModel onLicensesClicked', () async {
      sut.onLicensesClicked();
      verify(navigator.goToLicense()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('DebugViewModel onLicensesClicked', () async {
      sut.onTargetPlatformClicked();
      verify(navigator.goToDebugPlatformSelector()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('DebugViewModel onThemeModeClicked', () async {
      sut.onThemeModeClicked();
      verify(navigator.goToThemeModeSelector()).calledOnce();
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
