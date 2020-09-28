import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/navigators/main_navigator.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_util.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test main navigator widget show dialog', (tester) async {
    final key = GlobalKey<MainNavigatorWidgetState>();
    final sut = MainNavigatorWidget(key: key);
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_0_initial_screen');
    key.currentState.showCustomDialog(
      builder: (context) => SelectLanguageDialog(
        goBack: () {},
      ),
    );
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_1');
    key.currentState.closeDialog();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_2_go_back');
  });
}
