import 'package:flutter/cupertino.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late MockSharedPreferenceStorage shardPrefs;
  late DebugRepository sut;

  setUp(() async {
    await initTestInjectable();
    shardPrefs = getIt.resolveAs<SharedPreferenceStorage, MockSharedPreferenceStorage>();
    sut = DebugRepository(shardPrefs);

    when(shardPrefs.getBoolean(any)).thenReturn(false);
    when(shardPrefs.getString(any)).thenReturn(null);
  });

  group('saveSlowAnimations', () {
    test('saveSlowAnimations enabled true', () async {
      await sut.saveSlowAnimations(enabled: true);
      verify(shardPrefs.saveBoolean(key: 'enable_slow_animations', value: true)).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('saveSlowAnimations enabled false', () async {
      await sut.saveSlowAnimations(enabled: false);
      verify(shardPrefs.saveBoolean(key: 'enable_slow_animations', value: false)).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });
  });

  group('isSlowAnimationsEnabled', () {
    test('isSlowAnimationsEnabled when enabled was not set', () async {
      final result = sut.isSlowAnimationsEnabled();
      expect(result, false);
      verify(shardPrefs.getBoolean('enable_slow_animations')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('isSlowAnimationsEnabled when enabled was set to false', () async {
      when(shardPrefs.getBoolean('enable_slow_animations')).thenAnswer((_) => false);
      final result = sut.isSlowAnimationsEnabled();
      expect(result, false);
      verify(shardPrefs.getBoolean('enable_slow_animations')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('isSlowAnimationsEnabled when enabled was set to true', () async {
      when(shardPrefs.getBoolean('enable_slow_animations')).thenAnswer((_) => true);
      final result = sut.isSlowAnimationsEnabled();
      expect(result, true);
      verify(shardPrefs.getBoolean('enable_slow_animations')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });
  });

  group('saveSelectedPlatform', () {
    test('saveSelectedPlatform set to ios', () async {
      await sut.saveSelectedPlatform('ios');
      verify(shardPrefs.saveString(key: 'selected_platform', value: 'ios')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('saveSelectedPlatform set to android', () async {
      await sut.saveSelectedPlatform('android');
      verify(shardPrefs.saveString(key: 'selected_platform', value: 'android')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('saveSelectedPlatform set to null', () async {
      await sut.saveSelectedPlatform(null);
      verify(shardPrefs.deleteKey('selected_platform')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });
  });

  group('getTargetPlatform', () {
    test('getTargetPlatform set to ios', () async {
      when(shardPrefs.getString('selected_platform')).thenAnswer((_) => 'ios');
      final result = sut.getTargetPlatform();
      expect(result, TargetPlatform.iOS);
      verify(shardPrefs.getString('selected_platform')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('getTargetPlatform set to android', () async {
      when(shardPrefs.getString('selected_platform')).thenAnswer((_) => 'android');
      final result = sut.getTargetPlatform();
      expect(result, TargetPlatform.android);
      verify(shardPrefs.getString('selected_platform')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('getTargetPlatform set to something else', () async {
      when(shardPrefs.getString('selected_platform')).thenAnswer((_) => 'iasdofiodsaf');
      final result = sut.getTargetPlatform();
      expect(result, TargetPlatform.android);
      verify(shardPrefs.getString('selected_platform')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });

    test('saveSelectedPlatform set to null', () async {
      when(shardPrefs.getString('select_platform')).thenAnswer((_) => null);
      final result = sut.getTargetPlatform();
      expect(result, null);
      verify(shardPrefs.getString('selected_platform')).calledOnce();
      verifyNoMoreInteractions(shardPrefs);
    });
  });
}
