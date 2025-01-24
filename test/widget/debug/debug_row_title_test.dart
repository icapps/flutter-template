import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icapps_icons/icapps_icons.dart';

import '../../util/test_util.dart';

void main() {
  testWidgets('DebugRowTitle default', (tester) async {
    final widget = DebugRowTitle(
      title: TestUtil.getVariableString(),
      icon: IcappsIcons.fileData,
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_title_default_state');
  });
}
