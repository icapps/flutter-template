import 'package:flutter/material.dart';
import 'package:flutter_template/repository/debug_repository.dart';

class DebugViewModel with ChangeNotifier {
  final DebugRepository _debugRepo;

  DebugNavigator _navigator;

  var slowAnimationsEnabled = false;

  DebugViewModel(this._debugRepo);

  Future<void> init(DebugNavigator navigator) async {
    _navigator = navigator;
    _initValues();
  }

  void _initValues() {
    slowAnimationsEnabled = _debugRepo.isSlowAnimationsEnabled();
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onSlowAnimationsChanged(bool enabled) async {
    await _debugRepo.saveSlowAnimations(enabled: enabled);
    _initValues();
  }

  Future<void> onTargetPlatformClicked() async {
    await _navigator.goToTargetPlatformSelector();
    notifyListeners();
  }

  void onSelectLanguageClicked() {
    _navigator.goToSelectLanguage();
  }

  void onLicensesClicked() {
    _navigator.goToLicenses();
  }
}

abstract class DebugNavigator {
  Future<void> goToTargetPlatformSelector();

  void goToSelectLanguage();

  void goToLicenses();
}
