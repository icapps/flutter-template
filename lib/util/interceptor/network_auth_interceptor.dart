import 'package:dio/dio.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_template/util/app_constants.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkAuthInterceptor extends SimpleInterceptor {
  final AuthStorage _storage;
  final _excludedPaths = [
    'login',
  ];

  NetworkAuthInterceptor(this._storage);

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    if (_excludedPaths.contains(options.path)) {
      return super.onRequest(options);
    }
    final authorizationHeader = '${AppConstants.protectedAuthenticationHeaderPrefix} ${await _storage.getAccessToken()}';
    options.headers[AppConstants.authorizationHeader] = authorizationHeader;
    return options;
  }
}
