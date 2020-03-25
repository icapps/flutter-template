import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/responsive/responsive_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../util/test_screen_type.dart';
import '../../../util/test_util.dart';

void main() {
  const phoneSize = Size(400, 600);
  const tabletSize = Size(900, 1600);

  setUp(() async => TestKiwiUtil.init());

  testWidgets('ResponsiveWidget test builder on mobile', (tester) async {
    final sut = MediaQuery(
      data: const MediaQueryData(size: phoneSize),
      child: ResponsiveWidget(builder: (context, sizeInfo) => const Text('builder')),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_builder', screen: ScreenType.IPHONE11);
  });

  testWidgets('ResponsiveWidget test builder on mobile', (tester) async {
    const sut = MediaQuery(
      data: MediaQueryData(size: phoneSize),
      child: ResponsiveWidget(),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    expect(tester.takeException(), isInstanceOf<Exception>());
  });

  testWidgets('ResponsiveWidget test builder on tablet', (tester) async {
    const sut = MediaQuery(
      data: MediaQueryData(size: tabletSize),
      child: ResponsiveWidget(),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    expect(tester.takeException(), isInstanceOf<Exception>());
  });

  testWidgets('ResponsiveWidget test builder on tablet', (tester) async {
    final sut = MediaQuery(
      data: const MediaQueryData(size: tabletSize),
      child: ResponsiveWidget(builder: (context, sizeInfo) => const Text('builder')),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_builder', screen: ScreenType.IPADPRO);
  });

  testWidgets('ResponsiveWidget test landscape mobileBuilder on mobile', (tester) async {
    final sut = MediaQuery(
      data: MediaQueryData(
        size: Size(phoneSize.height, phoneSize.width), //trigger landscape
      ),
      child: ResponsiveWidget(
        landscapeBuilder: (context) => const Text('landscapeBuilder'),
        builder: (context, sizeInfo) => const Text('builder'),
      ),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_landscape_builder', screen: ScreenType.IPHONE11);
  });

  testWidgets('ResponsiveWidget test landscape mobileBuilder on tablet', (tester) async {
    final sut = MediaQuery(
      data: MediaQueryData(
        size: Size(tabletSize.height, tabletSize.width), //trigger landscape
      ),
      child: ResponsiveWidget(
        landscapeBuilder: (context) => const Text('landscapeBuilder'),
        builder: (context, sizeInfo) => const Text('builder'),
      ),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_landscape_builder', screen: ScreenType.IPADPRO);
  });

  testWidgets('ResponsiveWidget test tabletBuilder on mobile', (tester) async {
    final sut = MediaQuery(
      data: const MediaQueryData(size: phoneSize),
      child: ResponsiveWidget(
        tabletBuilder: (context) => const Text('tabletBuilder'),
        landscapeBuilder: (context) => const Text('landscapeBuilder'),
        builder: (context, sizeInfo) => const Text('builder'),
      ),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_tablet_builder', screen: ScreenType.IPHONE11);
  });

  testWidgets('ResponsiveWidget test landscape mobileBuilder on tablet', (tester) async {
    final sut = MediaQuery(
      data: const MediaQueryData(size: tabletSize),
      child: ResponsiveWidget(
        tabletBuilder: (context) => const Text('tabletBuilder'),
        landscapeBuilder: (context) => const Text('landscapeBuilder'),
        builder: (context, sizeInfo) => const Text('builder'),
      ),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_tablet_builder', screen: ScreenType.IPADPRO);
  });

  testWidgets('ResponsiveWidget test tabletBuilder on mobile', (tester) async {
    final sut = MediaQuery(
      data: MediaQueryData(
        size: Size(phoneSize.height, phoneSize.width), //trigger landscape
      ),
      child: ResponsiveWidget(
        tabletLandscapeBuilder: (context) => const Text('tabletLandscapeBuilder'),
        tabletBuilder: (context) => const Text('tabletBuilder'),
        landscapeBuilder: (context) => const Text('landscapeBuilder'),
        builder: (context, sizeInfo) => const Text('builder'),
      ),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_landscape_tablet_builder', screen: ScreenType.IPHONE11);
  });

  testWidgets('ResponsiveWidget test landscape mobileBuilder on tablet', (tester) async {
    final sut = MediaQuery(
      data: MediaQueryData(
        size: Size(tabletSize.height, tabletSize.width), //trigger landscape
      ),
      child: ResponsiveWidget(
        tabletLandscapeBuilder: (context) => const Text('tabletLandscapeBuilder'),
        tabletBuilder: (context) => const Text('tabletBuilder'),
        landscapeBuilder: (context) => const Text('landscapeBuilder'),
        builder: (context, sizeInfo) => const Text('builder'),
      ),
    );
    final testWidget = await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshotForScreenType(tester, testWidget, 'responsive_widget_landscape_tablet_builder', screen: ScreenType.IPADPRO);
  });
}
