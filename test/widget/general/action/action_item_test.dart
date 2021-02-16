import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('ActionItem default state', (tester) async {
    final sut = Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) => ActionItem(
          svgAsset: ThemeAssets.addIcon(context),
          onClick: () {},
        ),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'action_item_default_state');
  });

  testWidgets('ActionItem with custom color', (tester) async {
    final sut = Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) => ActionItem(
          svgAsset: ThemeAssets.addIcon(context),
          color: Colors.black,
          onClick: () {},
        ),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'action_item_custom_color');
  });

  testWidgets('ActionItem with test onClick', (tester) async {
    var clicked = false;

    final sut = Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.android),
      child: LayoutBuilder(
        builder: (context, constraint) => ActionItem(
          svgAsset: ThemeAssets.addIcon(context),
          onClick: () {
            clicked = true;
          },
        ),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'action_item_before_click');
    final finder = find.byType(ActionItem);
    expect(finder, findsOneWidget);
    expect(clicked, false);
    await tester.tap(finder);
    await tester.pumpAndSettle();
    expect(clicked, true);
    await TestUtil.takeScreenshot(tester, 'action_item_after_click');
  });
}
