import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

class DummyApiUtil {
  static const _API_ASSET_PATH = 'assets/api';

  static Future<T> getResponse<T>(String url) async {
    if (!FlavorConfig.isDummy()) {
      throw ArgumentError('Failed to get dummy response while configuration is not dummy');
    }
    final path = '$_API_ASSET_PATH/$url.json';
    try {
      FlutterTemplateLogger.logDebug('---------------> GET - url: file://$path');

      final jsonString = await rootBundle.loadString(path);
      FlutterTemplateLogger.logDebug('<--------------- GET - url: file://$path - statucode: 200');
      // ignore: avoid_as
      return json.decode(jsonString) as T;
    } catch (e) {
      FlutterTemplateLogger.logError(
        message: '<--------------- GET - url: $path - statucode: 404',
        error: e,
      );
      rethrow;
    }
  }
}
