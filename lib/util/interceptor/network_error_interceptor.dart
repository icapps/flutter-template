import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/bad_request_error.dart';
import 'package:flutter_template/model/exceptions/code_error.dart';
import 'package:flutter_template/model/exceptions/forbidden_error.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/internal_server_error.dart';
import 'package:flutter_template/model/exceptions/no_internet_error.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkErrorInterceptor extends SimpleInterceptor {
  final ConnectivityHelper connectivityHelper;

  NetworkErrorInterceptor(this.connectivityHelper);

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    final hasConnection = await connectivityHelper.hasConnection();
    if (!hasConnection) throw NoNetworkError();
    return super.onRequest(options);
  }

  @override
  Future<Object?> onError(DioError? error) async {
    try {
      if (error == null) return CodeError();
      if (error.error is NoNetworkError) return NoInternetError(error);
      if (error.response == null) return CodeError();
      final statusCode = error.response?.statusCode;
      switch (statusCode) {
        case UnAuthorizedError.statusCode:
          return UnAuthorizedError(error);
        case BadRequestError.statusCode:
          return BadRequestError.parseError(error);
        case ForbiddenError.statusCode:
          return ForbiddenError.parseError(error);
        case InternalServerError.statusCode:
          return InternalServerError(error);
        default:
          return GeneralNetworkError(error);
      }
    } catch (e, stack) {
      logger.error('Failed to get correct error', error: e, trace: stack);
      return CodeError();
    }
  }
}
