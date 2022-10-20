import 'package:flutter/material.dart';
import 'package:flutter_template/main_common.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugThemeSelectorViewmodel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final LocalStorage _localStorage;

  ThemeMode get themeMode => FlavorConfig.instance.themeMode;

  DebugThemeSelectorViewmodel(this._navigator, this._localStorage);

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    FlavorConfig.instance.themeMode = themeMode;
    await _localStorage.updateThemeMode(themeMode);
    updateAppTheme();
    if (!disposed) notifyListeners();
  }

  void onBackClicked() => _navigator.goBack<void>();
}
