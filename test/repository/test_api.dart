import 'dart:io';

import 'package:flutter_template/repository/api.dart';

///
/// TestApi is defined as a singleton in the test_injector.dart
/// TestApi should be accessed by KiwiContainer.resolve<TestApi>()
///
class TestApi extends Api {
  static const apiAssetPath = 'assets/api';

  @override
  Future<String> get(String url) async {
    //Thanks Flutter/Android studio for executing tests from a different directory
    final currentDir = Directory.current.path;
    final path = '$apiAssetPath/GET_$url.json';
    File file;
    if (currentDir.endsWith('/test')) {
      file = File('../$path');
    } else {
      file = File(path);
    }
    return file.readAsStringSync();
  }
}
