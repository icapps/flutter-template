import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../util/test_util.dart';

void main() {
  group('Android', () {
    testWidgets('FlutterTemplateButton initial state', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_default_state_android');
    });

    testWidgets('FlutterTemplateButton initial state expanded', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          isExpanded: true,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_expanded_android');
    });

    testWidgets('FlutterTemplateButton initial state with key', (tester) async {
      const key = ValueKey('A-Testing-Key');
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          key: key,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_with_key_android');
      final finder = find.byKey(key);
      expect(finder, findsOneWidget);
    });

    testWidgets('FlutterTemplateButton initial state is not enabled', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          isEnabled: false,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_not_enabled_android');
    });

    group('Clicked', () {
      testWidgets('FlutterTemplateButton initial state with key', (tester) async {
        var clicked = false;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: FlutterTemplateButton(
            text: 'Hallokes',
            onClick: () {
              clicked = true;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(FlutterTemplateButton);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(clicked, true);
      });
    });
  });

  group('iOS', () {
    testWidgets('FlutterTemplateButton initial state', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_default_state_ios');
    });

    testWidgets('FlutterTemplateButton initial state expanded', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          isExpanded: true,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_expanded_ios');
    });

    testWidgets('FlutterTemplateButton initial state with key', (tester) async {
      const key = ValueKey('A-Testing-Key');
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          key: key,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_with_key_ios');
      final finder = find.byKey(key);
      expect(finder, findsOneWidget);
    });

    testWidgets('FlutterTemplateButton initial state is not enabled', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: FlutterTemplateButton(
          text: 'Hallokes',
          isEnabled: false,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flutter_template_button_not_enabled_ios');
    });

    group('Clicked', () {
      testWidgets('FlutterTemplateButton initial state with key', (tester) async {
        var clicked = false;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: FlutterTemplateButton(
            text: 'Hallokes',
            onClick: () {
              clicked = true;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(FlutterTemplateButton);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(clicked, true);
      });
    });
  });
}
