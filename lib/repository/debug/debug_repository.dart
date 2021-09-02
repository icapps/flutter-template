import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class DebugRepository {
  @factoryMethod
  factory DebugRepository(SharedPreferenceStorage sharedPrefs) = _DebugRepository;

  Future<void> saveSlowAnimations({required bool enabled});

  bool isSlowAnimationsEnabled();

  Future<void> saveSelectedPlatform(String? selectedPlatform);

  TargetPlatform? getTargetPlatform();
}

class _DebugRepository implements DebugRepository {
  static const _KEY_ENABLE_SLOW_ANIMATIONS = 'enable_slow_animations';
  static const _KEY_SELECTED_PLATFORM = 'selected_platform';

  final SharedPreferenceStorage _sharedPrefs;

  _DebugRepository(this._sharedPrefs);

  @override
  Future<void> saveSlowAnimations({required bool enabled}) async {
    await _sharedPrefs.saveBoolean(key: _KEY_ENABLE_SLOW_ANIMATIONS, value: enabled);
  }

  @override
  bool isSlowAnimationsEnabled() {
    final slowAnimations = _sharedPrefs.getBoolean(_KEY_ENABLE_SLOW_ANIMATIONS) ?? false;
    if (slowAnimations) {
      timeDilation = 4.0;
    } else {
      timeDilation = 1.0;
    }
    return slowAnimations;
  }

  @override
  Future<void> saveSelectedPlatform(String? selectedPlatform) async {
    if (selectedPlatform == null) {
      await _sharedPrefs.deleteKey(_KEY_SELECTED_PLATFORM);
    } else {
      await _sharedPrefs.saveString(key: _KEY_SELECTED_PLATFORM, value: selectedPlatform);
    }
  }

  @override
  TargetPlatform? getTargetPlatform() {
    final selectedPlatform = _sharedPrefs.getString(_KEY_SELECTED_PLATFORM);
    if (selectedPlatform == null) return null;
    if (selectedPlatform == 'ios') return TargetPlatform.iOS;
    return TargetPlatform.android;
  }
}
