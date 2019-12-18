import 'dart:io';

mixin TestServiceMixIn {
  static const apiAssetPath = 'assets/api';

  Future<String> getResponse(String url) async {
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
