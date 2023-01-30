import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_template/widget/todo/todo_row_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../util/test_extensions.dart';
import '../../../util/test_util.dart';
import '../../seed.dart';
import 'todo_list_screen_test.mocks.dart';

@GenerateMocks([
  TodoListViewModel,
])
void main() {
  late MockTodoListViewModel todoListViewModel;

  setUp(() async {
    todoListViewModel = MockTodoListViewModel();
    getIt.registerLazySingleton<TodoListViewModel>(() => todoListViewModel);
    seedTodoListViewModel();
  });

  tearDown(() async {
    verifyTodoListViewModel();
    await getIt.reset();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_inital_state');
  });

  testWidgets('Test splash screen initial state darkmode', (tester) async {
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut, themeMode: ThemeMode.dark);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_inital_state_dark_mode');
  });

  testWidgets('Test splash screen empty state', (tester) async {
    when(todoListViewModel.dataStream).thenAnswer((_) => Stream.value([]));
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_empty_state');
  });

  testWidgets('Test splash screen error state', (tester) async {
    when(todoListViewModel.errorKey).thenReturn(LocalizationKeys.errorUnauthorized);
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_error_state');
  });

  testWidgets('Test splash screen loading state', (tester) async {
    when(todoListViewModel.isLoading).thenReturn(true);
    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_loading_state');
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
}

void verifyTodoListViewModel() {
  final viewModel = getIt<TodoListViewModel>();
  // verify(viewModel.dataStream);
  // verify(viewModel.isLoading);
  // verify(viewModel.errorKey);
  verify(viewModel.init()).calledOnce();
}
