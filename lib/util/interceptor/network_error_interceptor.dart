import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/bad_request_error.dart';
import 'package:flutter_template/model/exceptions/code_error.dart';
import 'package:flutter_template/model/exceptions/forbidden_error.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/internal_server_error.dart';
import 'package:flutter_template/model/exceptions/no_internet_error.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

class NetworkErrorInterceptor extends Interceptor {
  final ConnectivityControlling connectivityControlling;

  NetworkErrorInterceptor(this.connectivityControlling);

  @override
  Future onRequest(RequestOptions options) async {
    final hasConnection = await connectivityControlling.hasConnection();
    if (!hasConnection) throw NoNetworkError();
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    try {
      if (err == null) return CodeError();
      if (err.error is NoNetworkError) return NoInternetError(err);
      if (err.response == null) return CodeError();
      final statusCode = err.response.statusCode;
      switch (statusCode) {
        case UnAuthorizedError.statusCode:
          return UnAuthorizedError(err);
        case BadRequestError.statusCode:
          return BadRequestError.parseError(err);
        case ForbiddenError.statusCode:
          return ForbiddenError.parseError(err);
        case InternalServerError.statusCode:
          return InternalServerError(err);
        default:
          return GeneralNetworkError(err);
      }
    } catch (e) {
      FlutterTemplateLogger.logError(message: 'Failed to get correct error', error: e);
      return CodeError();
    }
  }
}
