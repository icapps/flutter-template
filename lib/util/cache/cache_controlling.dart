import 'dart:io';
import 'dart:typed_data';

abstract class CacheControlling {
  Future<Uint8List?> getFileFromCache(String url);

  Future<Uint8List> downloadFileByBytes(String url);

  Future<File> downloadFile(String url);

  Future<void> putFile(String url, Uint8List fileBytes, {required String fileExtension});
}
