import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('DebugRowSwitchItem selected state', (tester) async {
    final widget = DebugRowSwitchItem(
      title: 'Title',
      value: true,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_selected_state');
  });

  testWidgets('DebugRowSwitchItem selected state with subtitle', (tester) async {
    final widget = DebugRowSwitchItem(
      title: 'Title',
      subTitle: 'SubTitle',
      value: true,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_selected_state_subtitle');
  });

  testWidgets('DebugRowSwitchItem unselected state', (tester) async {
    final widget = DebugRowSwitchItem(
      title: 'Title',
      value: false,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_unselected_state');
  });

  testWidgets('DebugRowSwitchItem unselected state with subtitle', (tester) async {
    final widget = DebugRowSwitchItem(
      title: 'Title',
      subTitle: 'SubTitle',
      value: false,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_unselected_state_subtitle');
  });

  group('OnChanged', () {
    testWidgets('DebugRowSwitchItem selected state', (tester) async {
      bool? newValue;
      final widget = DebugRowSwitchItem(
        title: 'Title',
        value: true,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(DebugRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, false);
    });

    testWidgets('DebugRowSwitchItem selected state with subtitle', (tester) async {
      bool? newValue;
      final widget = DebugRowSwitchItem(
        title: 'Title',
        subTitle: 'SubTitle',
        value: true,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(DebugRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, false);
    });

    testWidgets('DebugRowSwitchItem unselected state', (tester) async {
      bool? newValue;
      final widget = DebugRowSwitchItem(
        title: 'Title',
        value: false,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(DebugRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, true);
    });

    testWidgets('DebugRowSwitchItem unselected state with subtitle', (tester) async {
      bool? newValue;
      final widget = DebugRowSwitchItem(
        title: 'Title',
        subTitle: 'SubTitle',
        value: false,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(DebugRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, true);
    });
  });
}
