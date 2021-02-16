import 'package:flutter_template/widget/general/action/text_action_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('TextActionItem default state', (tester) async {
    final sut = TextActionItem(
      text: 'Text for the text action item',
      onClick: () {},
      enabled: true,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'text_action_item_default_state');
  });

  testWidgets('TextActionItem disabled state', (tester) async {
    final sut = TextActionItem(
      text: 'Text for the text action item',
      onClick: () {},
      enabled: false,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'text_action_item_disabled_state');
  });
  testWidgets('TextActionItem click', (tester) async {
    var clicked = false;
    final sut = TextActionItem(
      text: 'Text for the text action item',
      onClick: () => clicked = true,
      enabled: true,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    final finder = find.byType(TextActionItem);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
    expect(clicked, true);
  });

  testWidgets('TextActionItem click', (tester) async {
    var clicked = false;
    final sut = TextActionItem(
      text: 'Text for the text action item',
      onClick: () => clicked = true,
      enabled: false,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    final finder = find.byType(TextActionItem);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
    expect(clicked, false);
  });
}
