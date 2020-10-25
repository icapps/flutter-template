import 'package:flutter/cupertino.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../di/test_kiwi_util.dart';
import '../mocks/viewmodel/global/mock_global_viewmodel.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  MockGlobalViewModel globalViewModel;

  setUp(() async {
    await TestKiwiUtil.init();
    globalViewModel = TestKiwiUtil.resolveAs<GlobalViewModel, MockGlobalViewModel>();

  });

  testWidgets('Test main navigator widget show dialog', (tester) async {
    seedGlobalViewModel();
    when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => true);
    when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
    when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);

    final key = GlobalKey<MainNavigatorWidgetState>();
    final sut = MainNavigatorWidget(key: key);
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_0_initial_screen');
    key.currentState.showCustomDialog<void>(
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
