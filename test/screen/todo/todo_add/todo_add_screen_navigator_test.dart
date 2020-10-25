import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
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

  testWidgets('Test todo add screen navigator', (tester) async {
    seedTodoAddViewModel();
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final debugKey = GlobalKey<TodoAddScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: TodoAddScreen(key: debugKey),
    );
    await TestUtil.loadScreen(tester, sut);

    debugKey.currentState.goBack<void>();
    verify(mockNavigation.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState.goBack(result: 'testing');
    verify(mockNavigation.goBack(result: 'testing')).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    final key = debugKey.currentState.getScaffoldState();
    expect(key, isNotNull);
    verifyNoMoreInteractions(mockNavigation);
  });
}
