import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_util.dart';


void main() {
  testWidgets('TestUtil should not load font', (tester) async {
    const sut = Text('Text');

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'test_util_without_font');
  });

  testWidgets('TestUtitl should load font', (tester) async {
    await TestUtil.loadFonts();

    const sut = Text('Text');

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'test_util_with_font');
  });
}
