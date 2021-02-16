import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('StatusBar light', (tester) async {
    final sut = StatusBar.light(
      child: Container(
        color: Colors.amber.withOpacity(0.5),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'status_bar_light');
  });
  testWidgets('StatusBar dark', (tester) async {
    final sut = StatusBar.dark(
      child: Container(
        color: Colors.amber.withOpacity(0.5),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'status_bar_dark');
  });
  group('Animated', () {
    testWidgets('StatusBar animated dark', (tester) async {
      final sut = StatusBar.animated(
        isDarkStyle: true,
        child: Container(
          color: Colors.amber.withOpacity(0.5),
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'status_bar_animated_dark');
    });
    testWidgets('StatusBar animated light', (tester) async {
      final sut = StatusBar.animated(
        isDarkStyle: false,
        child: Container(
          color: Colors.amber.withOpacity(0.5),
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'status_bar_animated_light');
    });
  });
}
