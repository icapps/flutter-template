import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
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

  testWidgets('Test debug select platform screen navigator test', (tester) async {
    final mockNavigation = MockMainNavigation();
    const widget = DebugPlatformSelectorScreen();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: widget,
    );
    await TestUtil.loadWidgetWithBuilder(tester, sut, (context) {
      widget.goBack(context);
      verify(mockNavigation.goBack()).calledOnce();
      verifyNoMoreInteractions(mockNavigation);

      widget.goBack(context, result: 'test');
      verify(mockNavigation.goBack(result: 'test')).calledOnce();
      verifyNoMoreInteractions(mockNavigation);
      // The builder function must return a widget.
      return const Placeholder();
    });
  });
}
