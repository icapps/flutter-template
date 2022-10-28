import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('SvgIcon initial state', (tester) async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.prod,
      color: Colors.purple,
      name: 'Test',
      supportsTheming: true,
      values: values,
    );
    const sut = SvgIcon(
      svgAsset: 'assets/images/icons/android/done.svg',
      color: Colors.amber,
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'svg_icon_prod_initial_state');
  });
}
