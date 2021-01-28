import 'package:flutter/widgets.dart';

mixin DisposeMixin on ChangeNotifier {
  var _disposed = false;

  @protected
  bool get disposed => _disposed;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
