import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/extension/color_extension.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/test_util.dart';

void main() {
  testWidgets('FlavorBanner initial state', (tester) async {
    final values = FlavorValues(
      baseUrl: 'http://${TestUtil.getVariableString()}',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.test,
      name: 'flavor_config_test',
      color: Colors.amber,
      values: values,
    );
    final sut = FlavorBanner(
      child: Container(
        color: Colors.amber.withOpacityValue(0.5),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flavor_banner_initial_state');
  });
}
