import 'package:flutter/material.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:injectable/injectable.dart';

@dev
@alpha
@beta
@prod
@injectable
class DebugPlatformSelectorViewModel with ChangeNotifier {
  DebugPlatformSelectorNavigator _navigator;

  Future<void> init(DebugPlatformSelectorNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackClicked() => _navigator.goBack<void>();
}

abstract class DebugPlatformSelectorNavigator implements BackNavigator {}
