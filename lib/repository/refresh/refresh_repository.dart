import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

@lazySingleton
abstract class RefreshRepository {
  @factoryMethod
  factory RefreshRepository(AuthStorage storage) = _RefreshRepository;

  Future<void> refresh(DioError err);

  void resetFailure();

  VoidCallback? logoutCallback;
}

class _RefreshRepository implements RefreshRepository {
  final AuthStorage _authStorage;
  final _lock = synchronized.Lock();
  bool _failure = false;

  @override
  VoidCallback? logoutCallback;

  _RefreshRepository(this._authStorage);

  @override
  void resetFailure() {
    _failure = false;
  }

  @override
  Future<void> refresh(DioError err) async {
    final accessToken = await _authStorage.getAccessToken();
    await _lock.synchronized(() async {
      final newAccessToken = await _authStorage.getAccessToken();
      if (accessToken != newAccessToken) {
        logger.debug('ACCESS TOKEN was already renewed');
        return;
      }
      if (_failure) {
        throw UnAuthorizedError(err);
      }
      try {
        await _authStorage.getRefreshToken();
        // TODO implement refresh call
        // await _authStoring.saveRefreshToken(refreshToken: result.refreshToken, accessToken: result.accessToken);
        throw UnimplementedError('No implementatino for the refresh in the refresh repository');
      } catch (e) {
        _failure = true;
        final logoutCb = logoutCallback;
        if (logoutCb != null) {
          await _authStorage.clear();
          logoutCb.call();
        }
        rethrow;
      }
    });
  }
}
