import 'package:flutter/foundation.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/error_handling/result.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

mixin ErrorHandlingViewModelMixin on ChangeNotifierEx {
  MainNavigator get navigator => getIt();

  Future<T?> failableFuture<T>(
    Future<Result<T>> Function() future, {
    ValueChanged<dynamic>? onError,
    ValueChanged<bool>? onLoadingChanged,
  }) async {
    onLoadingChanged?.call(true);
    notifyListeners();
    final result = await future();
    if (result.error != null) {
      navigator.showError(result);
      onError?.call(result.error);
      return null;
    }
    onLoadingChanged?.call(false);
    if (disposed) return null;
    notifyListeners();
    return result.data;
  }
}
