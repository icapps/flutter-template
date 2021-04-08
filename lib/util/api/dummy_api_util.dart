import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DummyApiUtil {
  static const _API_ASSET_PATH = 'assets/api';

  static Future<T> getResponse<T>(String url) async {
    if (!FlavorConfig.isDummy()) {
      throw ArgumentError('Failed to get dummy response while configuration is not dummy');
    }
    final path = '$_API_ASSET_PATH/$url.json';
    try {
      logger.debug('---------------> GET - url: file://$path');

      final jsonString = await rootBundle.loadString(path);
      logger.debug('<--------------- GET - url: file://$path - statucode: 200');
      // ignore: avoid_as
      return json.decode(jsonString) as T;
    } catch (e, stack) {
      logger.error(
        '<--------------- GET - url: $path - statucode: 404',
        error: e,
        trace: stack,
      );
      rethrow;
    }
  }
}
