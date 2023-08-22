import 'package:flutter_template/model/error_handling/result.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

mixin ErrorHandlingRepositoryMixin {
  Future<Result<T>> fetch<T>({
    required Future<T> Function() function,
    required String errorMessage,
  }) async {
    T? data;
    dynamic error;
    try {
      data = await function();
    } catch (e) {
      error = e;
      staticLogger.e(errorMessage, error: error);
    }

    return (data: data, error: error);
  }
}
