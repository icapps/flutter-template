import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../screen/seed.dart';
import '../../util/test_util.dart';
import 'data_provider_widget_test.mocks.dart';

@GenerateMocks([
  GlobalViewModel,
])
void main() {
  setUp(() async {
    getIt.registerLazySingleton<GlobalViewModel>(() => MockGlobalViewModel());
    seedGlobalViewModel();
  });

  tearDown(() async {
    await getIt.reset();
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
