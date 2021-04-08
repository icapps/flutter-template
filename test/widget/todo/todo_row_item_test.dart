import 'package:flutter_template/widget/todo/todo_row_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('TodoRowItem selected state', (tester) async {
    final sut = TodoRowItem(
      onChanged: (value) {},
      title: 'Title',
      value: true,
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'todo_row_item_selected_state');
  });

  testWidgets('TodoRowItem unselected state', (tester) async {
    final sut = TodoRowItem(
      onChanged: (value) {},
      title: 'Title',
      value: false,
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'todo_row_item_unselected_state');
  });

  group('OnChanged', () {
    testWidgets('TodoRowItem selected state on changed', (tester) async {
      bool? newValue;
      final sut = TodoRowItem(
        title: 'Title',
        value: true,
        onChanged: (value) {
          newValue = value;
        },
      );
      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(TodoRowItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, false);
    });
    testWidgets('TodoRowItem unselected state on changed', (tester) async {
      bool? newValue;

      final sut = TodoRowItem(
        title: 'Title',
        value: false,
        onChanged: (value) {
          newValue = value;
        },
      );
      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(TodoRowItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, true);
    });
  });
}
