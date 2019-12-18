import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template/repository/shared_prefs.dart';
import 'package:flutter_template/util/platform_util.dart';

class DebugRepository {
  static const KEY_ENABLE_SLOW_ANIMATIONS = 'enable_slow_animations';
  static const KEY_SELECTED_PLATFORM = 'selected_platform';

  final PlatformUtil _platformUtil;
  final SharedPrefs _sharedPrefs;

  DebugRepository(this._platformUtil, this._sharedPrefs);

  Future<void> saveSlowAnimations({bool enabled}) async {
    await _sharedPrefs.saveBoolean(KEY_ENABLE_SLOW_ANIMATIONS, enabled);
  }

  bool isSlowAnimationsEnabled() {
    final slowAnimations = _sharedPrefs.getBoolean(KEY_ENABLE_SLOW_ANIMATIONS) ?? false;
    if (slowAnimations) {
      timeDilation = 4.0;
    } else {
      timeDilation = 1.0;
    }
    return slowAnimations;
  }

  Future<void> saveSelectedPlatform(String selectedPlatform) async {
    if (selectedPlatform == null) {
      await _sharedPrefs.deleteKey(KEY_SELECTED_PLATFORM);
    } else {
      await _sharedPrefs.saveString(KEY_SELECTED_PLATFORM, selectedPlatform);
    }
  }

  TargetPlatform getTargetPlatform() {
    final selectedPlatform = _sharedPrefs.getString(KEY_SELECTED_PLATFORM);
    if (selectedPlatform == null) {
      if (_platformUtil.isAndroid()) {
        return null;
      } else if (_platformUtil.isIOS()) {
        return null;
      }
      throw UnsupportedError('Unsupported platform');
    }
    if (selectedPlatform == 'android') {
      return TargetPlatform.android;
    } else if (selectedPlatform == 'ios') {
      return TargetPlatform.iOS;
    }
    throw UnsupportedError('Unsupported platform');
  }
}
