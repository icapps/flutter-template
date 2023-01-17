import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../screen/seed.dart';
import '../util/test_util.dart';

@GenerateMocks([
  GlobalViewModel,
])
void main() {
  testWidgets('Test main navigator widget initial state', (tester) async {
    seedGlobalViewModel();

    final testWidget = await TestUtil.loadFlutterTemplateApp(tester);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_initial_screen');
  });
}
