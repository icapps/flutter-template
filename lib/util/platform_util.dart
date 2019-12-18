import 'dart:io';

abstract class PlatformUtil {
  bool isAndroid();
  bool isIOS();
}

class FlutterPlatformUtil extends PlatformUtil {
  @override
  bool isAndroid() => Platform.isAndroid;

  @override
  bool isIOS() => Platform.isIOS;
}
