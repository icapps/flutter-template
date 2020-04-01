import 'package:dio/dio.dart';

abstract class RefreshRepo {
  Future refresh(DioError err);

  void resetFailure();

  VoidCallback logoutCallback;
}
