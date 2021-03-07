import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

import '../app_constants.dart';

@singleton
class NetworkRefreshInterceptor extends Interceptor {
  final AuthStoring _authStoring;
  final RefreshRepo _refreshRepo;

  final _excludedPaths = [
    'login',
  ];

  NetworkRefreshInterceptor(
    this._authStoring,
    this._refreshRepo,
  );

  @override
  Future onResponse(Response response) {
    _refreshRepo.resetFailure();
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    final request = err.request;
    if (request == null) {
      return super.onError(err);
    }
    if (_excludedPaths.contains(request.path)) {
      FlutterTemplateLogger.logDebug('Network refresh interceptor should not intercept');
      return super.onError(err);
    }

    if (err is! UnAuthorizedError) {
      return super.onError(err);
    }

    FlutterTemplateLogger.logDebug('Refreshing');
    await _refreshRepo.refresh(err);

    final authorizationHeader = '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _authStoring.getAccessToken()}';
    request.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;

    final options = Options(
      method: request.method,
      sendTimeout: request.sendTimeout,
      receiveTimeout: request.receiveTimeout,
      extra: request.extra,
      headers: request.headers,
      responseType: request.responseType,
      contentType: request.contentType,
      validateStatus: request.validateStatus,
      receiveDataWhenStatusError: request.receiveDataWhenStatusError,
      followRedirects: request.followRedirects,
      maxRedirects: request.maxRedirects,
      requestEncoder: request.requestEncoder,
      responseDecoder: request.responseDecoder,
      listFormat: request.listFormat,
    );
    final _dio = GetIt.instance.get<Dio>();
    return _dio.request<dynamic>(request.path, options: options);
  }
}
