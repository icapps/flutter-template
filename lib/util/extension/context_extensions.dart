import 'package:flutter/material.dart';

extension BuilContextExtensions on BuildContext {
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;

  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
}
