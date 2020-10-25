import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../mocks/repository/todo/mock_todo_repository.dart';
import '../../../util/test_extensions.dart';

void main() {
  TodoAddViewModel sut;
  MockTodoRepository todoRepo;
  TodoAddNavigator navigator;

  setUp(() async {
    await TestKiwiUtil.init();
    todoRepo = TestKiwiUtil.resolveAs<TodoRepo, MockTodoRepository>();
    navigator = MockTodoAddNavigator();
    sut = TodoAddViewModel(todoRepo);
  });

  test('TodoAddViewModel init', () async {
    await sut.init(navigator);
    expect(sut.isSaveEnabled, false);
    verifyZeroInteractions(todoRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      await sut.init(navigator);
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
      expect(sut.isSaveEnabled,false);
      sut.onTodoChanged('mytodo');
      expect(sut.isSaveEnabled,true);
      verifyZeroInteractions(navigator);
      verifyZeroInteractions(todoRepo);
    });

    group('onSaveClicked', () {
      test('TodoAddViewModel onSaveClicked with no update', () async {
        await sut.onSaveClicked();
        verify(todoRepo.saveTodo(null)).calledOnce();
        verify(navigator.goBack(result: true)).calledOnce();
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

class MockTodoAddNavigator extends Mock implements TodoAddNavigator {}
