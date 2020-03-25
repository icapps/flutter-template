import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => TestKiwiUtil.init());

  testWidgets('TouchFeedBack on Android', (tester) async {
    final sut = Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: TouchFeedBack(
        child: Container(
          color: Colors.amber.withOpacity(0.5),
        ),
        onClick: () {},
      ),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'touch_feedback_android');
  });

  testWidgets('TouchFeedBack on iOS', (tester) async {
    final sut = Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: TouchFeedBack(
        child: Container(
          color: Colors.amber.withOpacity(0.5),
        ),
        onClick: () {},
      ),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'touch_feedback_ios');
  });

  group('Click', () {
    testWidgets('TouchFeedBack on Android with click', (tester) async {
      var onClickCalled = false;
      final sut = Theme(
        data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
        child: TouchFeedBack(
          child: Container(
            color: Colors.amber.withOpacity(0.5),
          ),
          onClick: () {
            onClickCalled = true;
          },
        ),
      );
      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(TouchFeedBack);
      expect(finder,findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(onClickCalled, true);
    });

    testWidgets('TouchFeedBack on iOS with click', (tester) async {
      var onClickCalled = false;
      final sut = Theme(
        data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
        child: TouchFeedBack(
          child: Container(
            color: Colors.amber.withOpacity(0.5),
          ),
          onClick: () {
            onClickCalled = true;
          },
        ),
      );
      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(TouchFeedBack);
      expect(finder,findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(onClickCalled, true);
    });
  });
}
