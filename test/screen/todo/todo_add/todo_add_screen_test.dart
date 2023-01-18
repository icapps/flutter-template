import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../util/test_extensions.dart';
import '../../../util/test_util.dart';
import '../../seed.dart';
import 'todo_add_screen_test.mocks.dart';

@GenerateMocks([
  TodoAddViewModel,
])
void main() {
  late TodoAddViewModel todoAddViewModel;

  setUp(() async {
    todoAddViewModel = MockTodoAddViewModel();
    getIt.registerLazySingleton<TodoAddViewModel>(() => todoAddViewModel);
    seedTodoAddViewModel();
  });

  tearDown(() {
    verifyTodoAddViewModel();
    getIt.reset();
  });

  testWidgets('Test todo add screen initial state', (tester) async {
    const sut = TodoAddScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_add_screen_inital_state');
  });

  testWidgets('Test todo add screen initial state darkmode', (tester) async {
    const sut = TodoAddScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut, themeMode: ThemeMode.dark);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_add_screen_inital_state_darkmode');
  });

  testWidgets('Test todo add screen button enabled', (tester) async {
    when(todoAddViewModel.isSaveEnabled).thenReturn(true);
    const sut = TodoAddScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_add_screen_enabled');
  });

  group('Actions', () {
    testWidgets('Test todo add screen button enabled disabled on back clicked', (tester) async {
      const sut = TodoAddScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byKey(Keys.backButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(todoAddViewModel.onBackClicked()).calledOnce();
    });

    testWidgets('Test todo add screen button disabled on save clicked', (tester) async {
      when(todoAddViewModel.isSaveEnabled).thenReturn(true);
      const sut = TodoAddScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byType(FlutterTemplateButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(todoAddViewModel.onSaveClicked()).calledOnce();
    });

    testWidgets('Test todo add screen button disabled on back clicked', (tester) async {
      const sut = TodoAddScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byType(FlutterTemplateButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
    });

    testWidgets('Test todo add screen should have an input field', (tester) async {
      const sut = TodoAddScreen();
      await TestUtil.loadScreen(tester, sut);

      final finder = find.byType(FlutterTemplateInputField);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      await tester.enterText(finder, 'test');

      verify(todoAddViewModel.onTodoChanged('test')).calledOnce();
    });
  });
}

void verifyTodoAddViewModel() {
  final todoAddViewModel = getIt<TodoAddViewModel>();
  verify(todoAddViewModel.isSaveEnabled);
}
