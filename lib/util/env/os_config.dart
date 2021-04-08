import 'dart:io';

import 'package:device_info/device_info.dart';

class OsConfig {
  final int androidSdk;
  final double iosVersion;
  static OsConfig? _instance;

  static Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdk = androidInfo.version.sdkInt;
      _instance = OsConfig._internal(androidSdk, 0);
    } else if (Platform.isIOS) {
      final androidInfo = await deviceInfo.iosInfo;
      final iosVersion = androidInfo.systemVersion;
      final lastIndexPoint = iosVersion.lastIndexOf('.');
      final versionLength = iosVersion.length;
      final version = iosVersion.replaceRange(lastIndexPoint, versionLength, '');
      final iosVersionValue = double.tryParse(version) ?? 0;
      _instance = OsConfig._internal(0, iosVersionValue);
    } else {
      _instance = OsConfig._internal(0, 0);
    }
  }

  OsConfig._internal(this.androidSdk, this.iosVersion);

  static OsConfig get instance => _instance!;

  //Android
  static bool get isAtLeastAndroid10 {
    if (Platform.isIOS) return false;
    return instance.androidSdk >= 29;
  }

  static bool get isAtLeastPie {
    if (Platform.isIOS) return false;
    return instance.androidSdk >= 28;
  }

  //iOS
  static bool get isIOS13OrAbove {
    if (Platform.isAndroid) return false;
    return instance.iosVersion >= 13;
  }
}