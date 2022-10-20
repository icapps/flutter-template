/analytics_permission_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../seed.dart';

void main() {
  late AnalyticsPermissionViewModel analyticsPermissionViewModel;

  setUp(() async {
    await initTestInjectable();
    analyticsPermissionViewModel = getIt();
    seedGlobalViewModel();
  });

  testWidgets('Test setup', (tester) async {});
}
