import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/widget/todo/todo_row_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/injectable_test.mocks.dart';
import '../../../di/test_injectable.dart';
import '../../../util/test_extensions.dart';
import '../../../util/test_themes_util.dart';
import '../../../util/test_util.dart';
import '../../seed.dart';

void main() {
  late MockTodoListViewModel todoListViewModel;

  setUp(() async {
    await initTestInjectable();
    todoListViewModel = getIt.resolveAs<TodoListViewModel, MockTodoListViewModel>();
    seedTodoListViewModel();
    seedGlobalViewModel();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_inital_state');
    verifyTodoListViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test splash screen initial state darkmode', (tester) async {
    TestThemeUtil.setDarkMode();
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_inital_state_dark_mode');
    verifyTodoListViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test splash screen empty state', (tester) async {
    when(todoListViewModel.dataStream).thenAnswer((_) => Stream.value([]));
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_empty_state');
    verifyTodoListViewModel();
    verifyGlobalViewModel();
  });

  testWidgets('Test splash screen error state', (tester) async {
    when(todoListViewModel.errorKey).thenReturn(LocalizationKeys.errorUnauthorized);
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_error_state');
    verify(todoListViewModel.isLoading);
    verify(todoListViewModel.errorKey);
    verify(todoListViewModel.init()).calledOnce();
    verifyGlobalViewModel();
  });

  testWidgets('Test splash screen loading state', (tester) async {
    when(todoListViewModel.isLoading).thenReturn(true);
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_loading_state');
    verify(todoListViewModel.isLoading);
    verify(todoListViewModel.init()).calledOnce();
    verifyGlobalViewModel();
  });

  group('With Data', () {
    tearDown(() async {
      verifyTodoListViewModel();
      verifyGlobalViewModel();
    });

    group('Actions', () {
      testWidgets('Test splash screen on download clicked', (tester) async {
        const sut = TodoListScreen();
        await TestUtil.loadScreen(tester, sut);

        final finder = find.byKey(Keys.downloadAction);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();

        verify(todoListViewModel.onDownloadClicked()).calledOnce();
      });

      testWidgets('Test splash screen on add clicked', (tester) async {
        const sut = TodoListScreen();
        await TestUtil.loadScreen(tester, sut);

        final finder = find.byKey(Keys.addAction);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();

        verify(todoListViewModel.onAddClicked()).calledOnce();
      });

      testWidgets('Test splash screen on add clicked', (tester) async {
        const sut = TodoListScreen();
        await TestUtil.loadScreen(tester, sut);

        final finder = find.byType(TodoRowItem);
        expect(finder, findsWidgets);
        await tester.tap(finder.first);
        await tester.pumpAndSettle();

        verify(todoListViewModel.onTodoChanged(id: 0, value: true)).calledOnce();
      });
    });
  });
}

void verifyTodoListViewModel() {
  final todoListViewModel = getIt.resolveAs<TodoListViewModel, MockTodoListViewModel>();
  verify(todoListViewModel.dataStream);
  verify(todoListViewModel.isLoading);
  verify(todoListViewModel.errorKey);
  verify(todoListViewModel.init()).calledOnce();
}
