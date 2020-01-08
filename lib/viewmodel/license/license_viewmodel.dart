import 'package:flutter/material.dart';

class LicenseViewModel with ChangeNotifier{
  LicenseNavigator _navigator;

  Future<void> init(LicenseNavigator navigator) async {
    _navigator = navigator;
  }
}

abstract class LicenseNavigator {}
