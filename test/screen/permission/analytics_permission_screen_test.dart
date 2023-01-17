import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/screen/permission/analytics_permission_screen.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

@GenerateMocks([
  GlobalViewModel,
  LocalStorage,
])
void main() {
  setUp(() async {
    seedGlobalViewModel();
    seedLocalStorage();
  });

  testWidgets('Test analyticsPermissionScreen initial state in light mode', (tester) async {
    const sut = AnalyticsPermissionScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'analytics_permission_screen_initial_state_light_mode');
    verifyAnalyticsPermissionViewModel();
  });

  testWidgets('Test analyticsPermissionScreen initial state in dark mode', (tester) async {
    const sut = AnalyticsPermissionScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'analytics_permission_screen_initial_state_dark_mode');
    verifyAnalyticsPermissionViewModel();
  });
}

void verifyAnalyticsPermissionViewModel() {
  final analyticsPermissionViewModel = getIt<AnalyticsPermissionViewModel>();
  verify(analyticsPermissionViewModel.init()).calledOnce();
}
