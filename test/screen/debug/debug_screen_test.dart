import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test debug screen default state', (tester) async {

    final mockNavigation = MockMainNavigation();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: DebugScreen(),
    );
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_initial_state_IGNORE'); //the image is not available in this screenshot WE DON'T KNOW WHY

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'debug_screen_initial_state');

    final target = find.byKey(Keys.targetPlatform);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();
    verify(mockNavigation.goToDebugPlatformSelector()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
