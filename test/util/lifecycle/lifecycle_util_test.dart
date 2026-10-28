import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/lifecycle/lifecycle_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  });

  tearDown(() {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
  });

  group('LifecycleUtil.appIsInBackground', () {
    test('is false when the app is resumed', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);

      expect(LifecycleUtil.appIsInBackground, isFalse);
    });

    test('is false when the app is inactive', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);

      expect(LifecycleUtil.appIsInBackground, isFalse);
    });

    test('is true when the app is hidden', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);

      expect(LifecycleUtil.appIsInBackground, isTrue);
    });

    test('is true when the app is paused', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

      expect(LifecycleUtil.appIsInBackground, isTrue);
    });

    test('is false again after the app returns to the foreground', () {
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      expect(LifecycleUtil.appIsInBackground, isTrue);

      binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);

      expect(LifecycleUtil.appIsInBackground, isFalse);
    });
  });
}
