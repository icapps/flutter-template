import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/permission/analytics_permission_screen.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  late AnalyticsPermissionViewModel analyticsPermissionViewModel;

  setUp(() async {
    await initTestInjectable();
    analyticsPermissionViewModel = getIt();
    seedGlobalViewModel();
    seedLocalStorage();
    seedAnalyticsPermissionViewModel();
  });

  testWidgets('Test analyticsPermissionScreen initial state in light mode', (tester) async {
    FlavorConfig.instance.themeMode = ThemeMode.light;

    final flutterTemplateTheme = getIt<FlutterTemplateTheme>();
    flutterTemplateTheme.configureForThemeStyle(FlutterTemplateThemeStyle.light);

    const sut = AnalyticsPermissionScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'analytics_permission_screen_initial_state_light_mode');
    verifyAnalyticsPermissionViewModel();
    FlavorConfig.instance.themeMode = ThemeMode.system;
  });

  testWidgets('Test analyticsPermissionScreen initial state in dark mode', (tester) async {
    FlavorConfig.instance.themeMode = ThemeMode.dark;

    final flutterTemplateTheme = getIt<FlutterTemplateTheme>();
    flutterTemplateTheme.configureForThemeStyle(FlutterTemplateThemeStyle.dark);
    const sut = AnalyticsPermissionScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'analytics_permission_screen_initial_state_dark_mode');
    verifyAnalyticsPermissionViewModel();
    FlavorConfig.instance.themeMode = ThemeMode.system;
  });
}

void verifyAnalyticsPermissionViewModel() {
  final analyticsPermissionViewModel = getIt.resolveAs<AnalyticsPermissionViewModel, MockAnalyticsPermissionViewModel>();
  verify(analyticsPermissionViewModel.init()).calledOnce();
}
