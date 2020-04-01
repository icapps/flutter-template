import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:flutter_template/repository/shared_prefs/shared_prefs_storing.dart';

class DebugRepository extends DebugRepo {
  static const _KEY_ENABLE_SLOW_ANIMATIONS = 'enable_slow_animations';
  static const _KEY_SELECTED_PLATFORM = 'selected_platform';

  final SharedPrefsStoring _sharedPrefs;

  DebugRepository(this._sharedPrefs);

  @override
  Future<void> saveSlowAnimations({bool enabled}) async {
    await _sharedPrefs.saveBoolean(key: _KEY_ENABLE_SLOW_ANIMATIONS, value: enabled ?? false);
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
  Future<void> saveSelectedPlatform(String selectedPlatform) async {
    if (selectedPlatform == null) {
      await _sharedPrefs.deleteKey(_KEY_SELECTED_PLATFORM);
    } else {
      await _sharedPrefs.saveString(key: _KEY_SELECTED_PLATFORM, value: selectedPlatform);
    }
  }

  @override
  TargetPlatform getTargetPlatform() {
    final selectedPlatform = _sharedPrefs.getString(_KEY_SELECTED_PLATFORM);
    if (selectedPlatform == null) return null;
    if (selectedPlatform == 'ios') return TargetPlatform.iOS;
    return TargetPlatform.android;
  }
}
