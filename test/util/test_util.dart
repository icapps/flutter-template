import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_app.dart';

class TestUtil {
  static Future<void> prepareSnapshotTestWidgetWithLocaleWrapper(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(TestWrapper(child: widget));
    await tester.pumpAndSettle();
  }

  static Future<void> prepareSnapshotTestWidget(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(Center(child: RepaintBoundary(child: widget)));
    await tester.pumpAndSettle();
  }

  static Future<void> snapshotTestWidgetWithLocaleWrapper(WidgetTester tester, Widget widget, String snapshotName) async {
    await tester.pumpWidget(TestWrapper(child: widget));
    await tester.pumpAndSettle();
    await test(tester, snapshotName);
  }

  static Future<void> snapshotTestWidget(WidgetTester tester, Widget widget, String snapshotName) async {
    await tester.pumpWidget(Center(child: RepaintBoundary(child: widget)));
    await tester.pumpAndSettle();
    await test(tester, snapshotName);
  }

  static Future<void> snapshotTestWidgetWithLocaleWrapperAndSafeArea(WidgetTester tester, Widget widget, String snapshotName) async {
    await tester.pumpWidget(TestWrapper(
      child: widget,
      simulateSafeArea: true,
    ));
    await tester.pumpAndSettle();
    await test(tester, snapshotName);
  }

  static Future<void> test(WidgetTester tester, String snapshotName) async {
    expect(find.byType(RepaintBoundary), findsOneWidget);
    await expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile('img/$snapshotName.png'),
    );
  }
}
