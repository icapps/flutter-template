import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  group('FlutterTemplateBackButton dark', () {
    testWidgets('FlutterTemplateBackButton dark initial state', (tester) async {
      final sut = FlutterTemplateBackButton.dark(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_back_button_dark');
    });

    testWidgets('FlutterTemplateBackButton dark initial state fullscreen', (tester) async {
      final sut = FlutterTemplateBackButton.dark(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_back_button_full_screen_dark');
    });

    testWidgets('FlutterTemplateBackButton dark click', (tester) async {
      var clicked = false;
      final sut = FlutterTemplateBackButton.dark(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(FlutterTemplateBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });

  group('FlutterTemplateBackButton light', () {
    testWidgets('FlutterTemplateBackButton light initial state', (tester) async {
      final sut = FlutterTemplateBackButton.light(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_back_button_light');
    });

    testWidgets('FlutterTemplateBackButton light initial state fullscreen', (tester) async {
      final sut = FlutterTemplateBackButton.light(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_back_button_full_screen_light');
    });

    testWidgets('FlutterTemplateBackButton light click', (tester) async {
      var clicked = false;
      final sut = FlutterTemplateBackButton.light(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(FlutterTemplateBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
