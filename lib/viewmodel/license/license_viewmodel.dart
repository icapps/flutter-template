import 'package:flutter/material.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/util/mixin/dispose_mixin.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LicenseViewModel with ChangeNotifier, DisposeMixin {
  LicenseNavigator _navigator;

  List<License> get licenses => LicenseUtil.getLicenses();

  Future<void> init(LicenseNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackClicked() => _navigator.goBack<void>();
}

abstract class LicenseNavigator with BackNavigator {}
