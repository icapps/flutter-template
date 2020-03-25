import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => TestKiwiUtil.init());

  testWidgets('DebugRowTitle default', (tester) async {
    const widget = DebugRowTitle(title: 'Title');

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_title_default_state');
  });
}
