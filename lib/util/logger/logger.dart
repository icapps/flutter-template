import 'package:dio/dio.dart';
import 'package:flutte_template/util/env/flavor_config.dart';

class Logger {
  Logger._();

  static void logNetworkRequest(RequestOptions options) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    print('---------------> url: ${options.uri.toString()}');
  }

  static void logNetworkResponse(Response response) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    print('<--------------- url: ${response.request.uri.toString()} - statucode: ${response.statusCode}');
  }

  static logNetworkError(DioError error) {
    if (!FlavorConfig.instance.values.logNetworkInfo) return;
    if (error.response == null) {
      print('request | ${error.request.toString()}');
      print('message | ${error.message}');
    } else {
      print('response.data | ${error.response.data}');
      print('response.headers | ${error.response.headers}');
    }
    print('<--------------- url: ${error.request.uri.toString()} - statucode: ${error.response.statusCode}');
  }
}
