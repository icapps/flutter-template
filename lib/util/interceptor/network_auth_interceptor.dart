import 'package:dio/dio.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storing.dart';
import 'package:flutter_template/util/app_constants.dart';

class NetworkAuthInterceptor extends Interceptor {
  final AuthStoring _storage;
  final _excludedPaths = [
    'login',
  ];

  NetworkAuthInterceptor(this._storage);

  @override
  Future onRequest(RequestOptions options) async {
    if (_excludedPaths.contains(options.path)) {
      return super.onRequest(options);
    }
    final authorizationHeader = '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _storage.getAccessToken()}';
    options.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;
    return options;
  }
}
