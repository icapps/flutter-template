import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../../util/test_extensions.dart';
import '../../../util/test_util.dart';
import '../../seed.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test splash screen navigator', (tester) async {
    seedTodoListViewModel();
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final debugKey = GlobalKey<TodoListScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: TodoListScreen(key: debugKey),
    );
    await TestUtil.loadScreen(tester, sut);

    debugKey.currentState.goBack<void>();
    verify(mockNavigation.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState.goBack(result: 'testing');
    verify(mockNavigation.goBack(result: 'testing')).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState.goToAddTodo();
    verify(mockNavigation.goToAddTodo()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    final key = debugKey.currentState.getScaffoldState();
    expect(key, isNotNull);
    verifyNoMoreInteractions(mockNavigation);
  });
}
