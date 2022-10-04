import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_template/util/cache/cache_controlling.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CacheControlling)
class CacheController extends CacheControlling {
  @override
  Future<Uint8List?> getFileFromCache(String url) async {
    final fileInfo = await DefaultCacheManager().getFileFromCache(url);
    return fileInfo?.file.readAsBytes();
  }

  @override
  Future<Uint8List> downloadFileByBytes(String url) async {
    final file = await downloadFile(url);
    return file.readAsBytes();
  }

  @override
  Future<File> downloadFile(String url) async {
    final fileInfo = await DefaultCacheManager().downloadFile(url);
    return fileInfo.file;
  }

  @override
  Future<void> putFile(String url, Uint8List fileBytes, {required String fileExtension}) async {
    await DefaultCacheManager().putFile(url, fileBytes, fileExtension: fileExtension);
  }
}
