import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtil {
  PlatformUtil._();

  static bool get isIOS => !kIsWeb && Platform.isIOS;

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  static bool get isWeb => kIsWeb;

  static bool get isDesktop => !isIOS && !isAndroid;
}
