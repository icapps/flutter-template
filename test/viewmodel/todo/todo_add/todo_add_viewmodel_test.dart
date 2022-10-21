import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/injectable_test.mocks.dart';
import '../../../di/test_injectable.dart';
import '../../../util/test_extensions.dart';

void main() {
  late TodoAddViewModel sut;
  late MockTodoRepository todoRepo;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    todoRepo = getIt.resolveAs<TodoRepository, MockTodoRepository>();
    navigator = MockMainNavigator();
    sut = TodoAddViewModel(todoRepo, navigator);
  });

  test('TodoAddViewModel init', () async {
    expect(sut.isSaveEnabled, false);
    verifyZeroInteractions(todoRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      reset(todoRepo);
      reset(navigator);
    });

    test('TodoAddViewModel onBackClicked', () async {
      sut.onBackClicked();
      verify(navigator.goBack<void>()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(todoRepo);
    });

    test('TodoAddViewModel onBackClicked', () async {
      expect(sut.isSaveEnabled, false);
      sut.onTodoChanged('mytodo');
      expect(sut.isSaveEnabled, true);
      verifyZeroInteractions(navigator);
      verifyZeroInteractions(todoRepo);
    });

    group('onSaveClicked', () {
      test('TodoAddViewModel onSaveClicked with no update', () async {
        await sut.onSaveClicked();
        verify(navigator.showError(any)).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });

      test('TodoAddViewModel onSaveClicked with update', () async {
        sut.onTodoChanged('mytodo');
        await sut.onSaveClicked();
        verify(todoRepo.saveTodo('mytodo')).calledOnce();
        verify(navigator.goBack(result: true)).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });

      test('TodoAddViewModel onSaveClicked with update with spaces', () async {
        sut.onTodoChanged('  mytodo  ');
        await sut.onSaveClicked();
        verify(todoRepo.saveTodo('mytodo')).calledOnce();
        verify(navigator.goBack(result: true)).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });
    });
  });
}
