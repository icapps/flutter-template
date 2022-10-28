import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../screen/seed.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';

void main() {
  late GlobalViewModel globalViewModel;

  setUp(() async {
    await initTestInjectable();
    globalViewModel = getIt();
    seedGlobalViewModel();
  });

  testWidgets('SelectLanguageDialog initial state', (tester) async {
    when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => true);
    when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
    when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
    final widget = SelectLanguageDialog(goBack: () {});

    await TestUtil.loadScreen(tester, widget);
    await TestUtil.takeScreenshot(tester, 'select_language_dialog_initial_state');

    verify(globalViewModel.isLanguageSelected(any));
    verifyGlobalViewModel();
  });

  group('Selected language', () {
    testWidgets('SelectLanguageDialog system default selected', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => true);
      final widget = SelectLanguageDialog(goBack: () {});

      await TestUtil.loadScreen(tester, widget);
      await TestUtil.takeScreenshot(tester, 'select_language_dialog_system_defaults_selected');

      verify(globalViewModel.isLanguageSelected(any));
      verifyGlobalViewModel();
    });

    testWidgets('SelectLanguageDialog english selected', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => true);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      final widget = SelectLanguageDialog(goBack: () {});

      await TestUtil.loadScreen(tester, widget);
      await TestUtil.takeScreenshot(tester, 'select_language_dialog_en_selected');

      verify(globalViewModel.isLanguageSelected(any));
      verifyGlobalViewModel();
    });

    testWidgets('SelectLanguageDialog nederlands selected', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => true);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      final widget = SelectLanguageDialog(goBack: () {});

      await TestUtil.loadScreen(tester, widget);
      await TestUtil.takeScreenshot(tester, 'select_language_dialog_nl_selected');

      verify(globalViewModel.isLanguageSelected(any));
      verifyGlobalViewModel();
    });
  });

  group('Click language select', () {
    testWidgets('SelectLanguageDialog on click english', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => true);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('English');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalViewModel.isLanguageSelected(any));
      verify(globalViewModel.onSwitchToEnglish()).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click nederlands', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => true);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('Nederlands');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalViewModel.isLanguageSelected(any));
      verify(globalViewModel.onSwitchToDutch()).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click system defaults', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => true);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = TextFinder(LocalizationKeys.generalLabelSystemDefault, substring: true);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalViewModel.isLanguageSelected(any));
      verify(globalViewModel.onSwitchToSystemLanguage()).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });

    testWidgets('SelectLanguageDialog on click english', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('English');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalViewModel.isLanguageSelected(any));
      verify(globalViewModel.onSwitchToEnglish()).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click nederlands', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('Nederlands');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalViewModel.isLanguageSelected(any));
      verify(globalViewModel.onSwitchToDutch()).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click system defaults', (tester) async {
      when(globalViewModel.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalViewModel.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = TextFinder(LocalizationKeys.generalLabelSystemDefault, substring: true);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalViewModel.isLanguageSelected(any));
      verify(globalViewModel.onSwitchToSystemLanguage()).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
  });
}
