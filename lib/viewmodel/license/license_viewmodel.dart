import 'package:flutter/material.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';

class LicenseViewModel with ChangeNotifier {
  LicenseNavigator _navigator;

  Future<void> init(LicenseNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackClicked() => _navigator.goBack();
}

abstract class LicenseNavigator with BackNavigator {}
