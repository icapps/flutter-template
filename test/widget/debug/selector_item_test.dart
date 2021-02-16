import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('SelectorItem initial state', (tester) async {
    final widget = SelectorItem(
      title: 'Title',
      selected: false,
      onClick: () {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'selector_item_initial_state');
  });

  testWidgets('SelectorItem selected state', (tester) async {
    final widget = SelectorItem(
      title: 'Title',
      selected: true,
      onClick: () {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'selector_item_selected_state');
  });

  group('Click callback', () {
    testWidgets('SelectorItem selected state on click', (tester) async {
      var clicked = false;
      final widget = SelectorItem(
        title: 'Title',
        selected: true,
        onClick: () {
          clicked = true;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SelectorItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
    testWidgets('SelectorItem unselected state on click', (tester) async {
      var clicked = false;
      final widget = SelectorItem(
        title: 'Title',
        selected: false,
        onClick: () {
          clicked = true;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SelectorItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
