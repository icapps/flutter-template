import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../util/test_extensions.dart';
import 'todo_add_viewmodel_test.mocks.dart';

@GenerateMocks([
  TodoRepository,
  MainNavigator,
])
void main() {
  late TodoAddViewModel sut;
  late MockTodoRepository todoRepo;
  late MainNavigator navigator;

  setUp(() async {
    todoRepo = MockTodoRepository();
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
      verify(navigator.goBack()).calledOnce();
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
        verify(navigator.goBackWithResult(result: true)).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });

      test('TodoAddViewModel onSaveClicked with update with spaces', () async {
        sut.onTodoChanged('  mytodo  ');
        await sut.onSaveClicked();
        verify(todoRepo.saveTodo('mytodo')).calledOnce();
        verify(navigator.goBackWithResult(result: true)).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });
    });
  });
}
