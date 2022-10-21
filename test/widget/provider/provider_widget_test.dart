import 'package:flutter/material.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../screen/seed.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
    seedGlobalViewModel();
    // await initArchitecture();
  });

  testWidgets('ProviderWidget throw exception', (tester) async {
    final sut = ProviderWidget<TestViewModel>(
      create: () => TestViewModel(),
    );
    await TestUtil.loadWidgetWithText(tester, sut);
    expect(tester.takeException(), isInstanceOf<ArgumentError>());
  });

  testWidgets('ProviderWidget should show child', (tester) async {
    final sut = ProviderWidget<TestViewModel>(
      create: () => TestViewModel(),
      child: const Material(child: Text('test')),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'provider_widget_child');
  });

  testWidgets('ProviderWidget should show childbuilder with viewmodel', (tester) async {
    final sut = ProviderWidget<TestViewModel>(
      create: () => TestViewModel(),
      childBuilderWithViewModel: (context, item, _, __) => const Material(child: Text('Test')),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'provider_widget_child_builder');
  });

  testWidgets('ProviderWidget should show childbuilder with consumer', (tester) async {
    final sut = ProviderWidget<TestViewModel>(
      create: () => TestViewModel(),
      consumer: (context, viewModel, widget) => const Material(child: Text('Hello')),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'provider_widget_consumer');
  });

  testWidgets('ProviderWidget should show childbuilder with consumer and consumerChild', (tester) async {
    final sut = ProviderWidget<TestViewModel>(
      create: () => TestViewModel(),
      consumerChild: const Text('Hallo 2'),
      consumer: (context, viewModel, child) => Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello'),
            if (child != null) child,
          ],
        ),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'provider_widget_consumer_and_consumer_child');
  });
}

class TestViewModel extends ChangeNotifier {}
