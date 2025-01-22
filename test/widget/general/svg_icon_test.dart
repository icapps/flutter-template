import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/test_util.dart';

void main() {
  testWidgets('SvgIcon initial state', (tester) async {
    const sut = SvgIcon(svgAsset: 'assets/images/icons/android/done.svg');

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'svg_icon_initial_state');
  });

  testWidgets('SvgIcon custom color', (tester) async {
    const sut = SvgIcon(
      svgAsset: 'assets/images/icons/android/done.svg',
      color: Colors.purple,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'svg_icon_custom_color');
  });

  testWidgets('SvgIcon custom size', (tester) async {
    const sut = SvgIcon(
      svgAsset: 'assets/images/icons/android/done.svg',
      size: 64,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'svg_icon_custom_size');
  });

  testWidgets('SvgIcon custom size and color', (tester) async {
    const sut = SvgIcon(
      svgAsset: 'assets/images/icons/android/done.svg',
      color: Colors.purple,
      size: 64,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'svg_icon_custom_size_and_color');
  });
  testWidgets('SvgIcon custom size and color', (tester) async {
    final sut = LayoutBuilder(
        builder: (context, constraints) => const SvgIcon(
              svgAsset: ThemeAssets.checkIcon,
              color: Colors.purple,
              size: 64,
            ));

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'svg_icon_custom_size_and_color');
  });
}
