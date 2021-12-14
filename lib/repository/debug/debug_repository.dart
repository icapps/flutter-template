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
  static const _enableSlowAnimationsKey = 'enable_slow_animations';
  static const _selectedPlatformKey = 'selected_platform';

  final SharedPreferenceStorage _sharedPreferences;

  _DebugRepository(this._sharedPreferences);

  @override
  Future<void> saveSlowAnimations({required bool enabled}) async {
    await _sharedPreferences.saveBoolean(key: _enableSlowAnimationsKey, value: enabled);
  }

  @override
  bool isSlowAnimationsEnabled() {
    final slowAnimations = _sharedPreferences.getBoolean(_enableSlowAnimationsKey) ?? false;
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
      await _sharedPreferences.deleteKey(_selectedPlatformKey);
    } else {
      await _sharedPreferences.saveString(key: _selectedPlatformKey, value: selectedPlatform);
    }
  }

  @override
  TargetPlatform? getTargetPlatform() {
    final selectedPlatform = _sharedPreferences.getString(_selectedPlatformKey);
    if (selectedPlatform == null) return null;
    if (selectedPlatform == 'ios') return TargetPlatform.iOS;
    return TargetPlatform.android;
  }
}
