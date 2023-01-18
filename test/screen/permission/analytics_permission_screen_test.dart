import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/permission/analytics_permission_screen.dart';
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import 'analytics_permission_screen_test.mocks.dart';

@GenerateMocks([
  AnalyticsPermissionViewModel,
])
void main() {
  setUp(() async {
    getIt.registerLazySingleton<AnalyticsPermissionViewModel>(() => MockAnalyticsPermissionViewModel());
  });

  tearDown(() {
    verifyAnalyticsPermissionViewModel();
    getIt.reset();
  });

  testWidgets('Test analyticsPermissionScreen initial state in light mode', (tester) async {
    const sut = AnalyticsPermissionScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'analytics_permission_screen_initial_state_light_mode');
  });

  testWidgets('Test analyticsPermissionScreen initial state in dark mode', (tester) async {
    const sut = AnalyticsPermissionScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'analytics_permission_screen_initial_state_dark_mode');
  });
}

void verifyAnalyticsPermissionViewModel() {
  final analyticsPermissionViewModel = getIt<AnalyticsPermissionViewModel>();
  verify(analyticsPermissionViewModel.init()).calledOnce();
}
