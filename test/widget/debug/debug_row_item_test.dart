import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('DebugRowItem without subtitle', (tester) async {
    final widget = DebugRowItem(
      title: 'Title',
      onClick: () {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_item_with_title');
  });

  testWidgets('DebugRowItem with subtitle', (tester) async {
    final widget = DebugRowItem(
      title: 'Title',
      subTitle: 'SubTitle',
      onClick: () {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_item_with_subtitle');
  });

  group('Click callback', () {
    testWidgets('DebugRowItem without subtitle on click', (tester) async {
      var clicked = false;
      final widget = DebugRowItem(
        title: 'Title',
        onClick: () {
          clicked = true;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(DebugRowItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
    testWidgets('DebugRowItem with subtitle on click', (tester) async {
      var clicked = false;
      final widget = DebugRowItem(
        title: 'Title',
        subTitle: 'Subtitle',
        onClick: () {
          clicked = true;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(DebugRowItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
