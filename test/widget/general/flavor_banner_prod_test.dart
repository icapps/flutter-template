import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('FlavorBanner initial state in production', (tester) async {
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
    final sut = FlavorBanner(
      child: Container(
        color: Colors.amber.withOpacity(0.5),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flavor_banner_prod_initial_state');
  });
}
