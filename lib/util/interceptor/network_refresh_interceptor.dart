import 'package:kiwi/kiwi.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/refresh/refresh_repo.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';

import '../app_constants.dart';

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
    if (_excludedPaths.contains(err.request.path)) {
      FlutterTemplateLogger.logDebug('Network refresh interceptor should not intercept');
      return super.onError(err);
    }

    FlutterTemplateLogger.logDebug('Refreshing');
    final _dio = KiwiContainer().resolve<Dio>();

    if (err is! UnAuthorizedError) {
      return super.onError(err);
    }

    await _refreshRepo.refresh(err);
    final options = err.response.request;
    final authorizationHeader = '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _authStoring.getAccessToken()}';
    options.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;

    return _dio.request<dynamic>(options.path, options: options);
  }
}
