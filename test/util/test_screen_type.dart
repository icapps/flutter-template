import 'package:flutter/material.dart';

enum ScreenType { iPhone11, iPadPro }

extension ScreenTypeProperties on ScreenType {
  Size get size {
    switch (this) {
      case ScreenType.iPhone11:
        return Size(828 * 1.5, 1792 * 1.5 - getStatusBarHeight);
      case ScreenType.iPadPro:
        return Size(2048 * 1.5, 2732 * 1.5 - getStatusBarHeight);
      default:
        return const Size(500, 500);
    }
  }

  int get getStatusBarHeight {
    switch (this) {
      case ScreenType.iPhone11:
        return 88;
      case ScreenType.iPadPro:
        return 40;
      default:
        return 48;
    }
  }

  String get name {
    switch (this) {
      case ScreenType.iPhone11:
        return 'iphone_11';
      case ScreenType.iPadPro:
        return 'ipad_pro';
      default:
        return 'unknown_device';
    }
  }
}
