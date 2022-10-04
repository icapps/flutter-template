import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());
  testWidgets('FlutterTemplateInputField with enabled true', (tester) async {
    final sut = FlutterTemplateInputField(
      onChanged: (value) {},
      enabled: true,
      hint: 'Hint text',
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flutter_template_input_field_with_hint_and_enabled');
  });

  testWidgets('FlutterTemplateInputField with enabled false', (tester) async {
    final sut = FlutterTemplateInputField(
      onChanged: (value) {},
      enabled: false,
      hint: 'Hint text',
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flutter_template_input_field_with_hint_and_disabled');
  });

  group('OnChanged', () {
    testWidgets('FlutterTemplateInputField with false value', (tester) async {
      String? newText;
      final sut = FlutterTemplateInputField(
        onChanged: (value) {
          newText = value;
        },
        enabled: true,
        hint: 'Hint text',
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_input_field_type_text_before');
      final finder = find.byType(FlutterTemplateInputField);
      expect(finder, findsOneWidget);
      await tester.showKeyboard(finder);
      await tester.enterText(finder, 'Testing');
      await tester.pumpAndSettle();
      await TestUtil.takeScreenshot(tester, 'flutter_template_input_field_type_text_after');
      expect(newText, 'Testing');
    });
  });
}
