import 'package:flutter_template/widget/library/flutter_template_progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('FlutterTemplateProgressIndicator initial state', (tester) async {
    const sut = FlutterTemplateProgressIndicator.light();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flutter_template_progress_indicator_light');
  });

  testWidgets('FlutterTemplateProgressIndicator initial state dark', (tester) async {
    const sut = FlutterTemplateProgressIndicator.dark();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flutter_template_progress_indicator_dark');
  });
}
