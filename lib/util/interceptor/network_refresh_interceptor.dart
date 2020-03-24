import 'package:dio/dio.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/app_constants.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

class NetworkRefreshInterceptor extends Interceptor {
  final AuthStoring _authStoring;

  final _excludedPaths = [
    '/login',
  ];
  var _failure = false;
  VoidCallback logoutCallback;
  final _lock = synchronized.Lock();

  NetworkRefreshInterceptor(this._authStoring);

  @override
  Future onResponse(Response response) {
    _failure = false;
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (_excludedPaths.contains(err.request.path)) {
      FlutterTemplateLogger.logDebug('Network refresh interceptor should not intercept');
      return super.onError(err);
    }

    FlutterTemplateLogger.logDebug('Refreshing');
    final _dio = KiwiContainer.resolve<Dio>();

    if (err is! UnAuthorizedError) {
      return super.onError(err);
    }

    await _refresh(err);
    final options = err.response.request;
    final authorizationHeader = '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _authStoring.getAccessToken()}';
    options.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;

    return _dio.request(options.path, options: options);
  }

  //This method can also be placed in a RefreshRepository
  Future _refresh(DioError err) async {
    final accessToken = await _authStoring.getAccessToken();
    await _lock.synchronized(() async {
      final newAccessToken = await _authStoring.getAccessToken();
      if (accessToken != newAccessToken) {
        FlutterTemplateLogger.logDebug('ACCESS TOKEN was already renewed');
        return;
      }
      if (_failure) {
        throw UnAuthorizedError(err);
      }
      try {
        // ignore: unused_local_variable
        final refreshToken = await _authStoring.getRefreshToken();

        //perform refresh call
        //save refresh token
      } catch (e) {
        _failure = true;
        if (logoutCallback != null) {
          await _authStoring.logoutUser();
          logoutCallback();
        }
        rethrow;
      }
    });
  }
}
