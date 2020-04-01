import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback_ios.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => TestKiwiUtil.init());

  testWidgets('TouchFeedBackIos', (tester) async {
    final sut = TouchFeedBackIOS(
      child: Container(
        color: Colors.amber.withOpacity(0.5),
      ),
      onClick: () {},
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'touch_feedback_ios_widget');
  });

  group('Click', () {
    testWidgets('TouchFeedBackIos with click', (tester) async {
      var onClickCalled = false;
      final sut = TouchFeedBackIOS(
        child: Container(
          color: Colors.amber.withOpacity(0.5),
        ),
        onClick: () {
          onClickCalled = true;
        },
      );
      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(TouchFeedBackIOS);
      expect(finder,findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(onClickCalled, true);
    });
  });
}
