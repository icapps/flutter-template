import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
    // await initArchitecture();
  });

  testWidgets('Test main navigator widget initial state', (tester) async {
    seedGlobalViewModel();

    final testWidget = await TestUtil.loadFlutterTemplateApp(tester);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_initial_screen');
  });
}
