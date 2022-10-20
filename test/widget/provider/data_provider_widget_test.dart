import 'package:flutter/material.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../screen/seed.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
    seedGlobalViewModel();
  });

  testWidgets('DataProviderWidget throw exception', (tester) async {
    const sut = DataProviderWidget();
    await TestUtil.loadWidgetWithText(tester, sut);
    expect(tester.takeException(), isInstanceOf<ArgumentError>());
  });

  testWidgets('DataProviderWidget should build with theme', (tester) async {
    final sut = DataProviderWidget(
      childBuilderTheme: (context, _) => const Material(child: Text('Test')),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'data_provider_widget_theme');
  });

  testWidgets('DataProviderWidget should build with localization', (tester) async {
    final sut = DataProviderWidget(
      childBuilderLocalization: (context, _) => const Material(child: Text('Test')),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'data_provider_widget_localization');
  });

  testWidgets('DataProviderWidget should build with theme and localization', (tester) async {
    final sut = DataProviderWidget(
      childBuilder: (context, _, __) => const Material(child: Text('Test')),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'data_provider_widget_theme_and_localization');
  });
}

class TestViewModel extends ChangeNotifier {}
