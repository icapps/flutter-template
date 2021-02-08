import 'package:flutter/material.dart';
import 'package:flutter_template/util/mixin/dispose_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

class TestDisposeMixin with ChangeNotifier, DisposeMixin {
  bool get isDisposed => disposed;
}

void main() {
  test('DisposeMixin test debug', () async {
    final test = TestDisposeMixin();
    expect(test.isDisposed, false);
    test.dispose();
    expect(test.isDisposed, true);
  });
}
