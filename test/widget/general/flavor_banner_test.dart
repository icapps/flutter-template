import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('FlavorBanner initial state', (tester) async {
    final sut = FlavorBanner(
      child: Container(
        color: Colors.amber.withOpacity(0.5),
      ),
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flavor_banner_initial_state');
  });
}
