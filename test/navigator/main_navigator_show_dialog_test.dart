import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../di/test_injectable.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  late GlobalViewModel globalViewModel;

  setUp(() async {
    await initTestInjectable();
    globalViewModel = getIt();
  });

  testWidgets('Test main navigator widget show dialog', (tester) async {
    seedGlobalViewModel();
    seedAuthStorage();
    when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => true);
    when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
    when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);

    final mainNavigator = MainNavigator(getIt.get());
    final testWidget = await TestUtil.loadScreen(tester, const SizedBox.shrink());
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_0_initial_screen');
    unawaited(mainNavigator.showCustomDialog<void>(
      widget: SelectLanguageDialog(
        goBack: () {},
      ),
    ));
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_1');
    mainNavigator.closeDialog();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_show_dialog_2_go_back');
  });
}
