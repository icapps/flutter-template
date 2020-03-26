import 'package:flutter_template/model/exceptions/general_network_error.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../mocks/repository/todo/mock_todo_repository.dart';
import '../../../util/test_extensions.dart';

void main() {
  TodoListViewModel sut;
  MockTodoRepository todoRepo;
  TodoListViewNavigator navigator;

  setUp(() async {
    await TestKiwiUtil.init();
    todoRepo = TestKiwiUtil.resolveAs<TodoRepo, MockTodoRepository>();
    navigator = MockTodoListNavigator();
    sut = TodoListViewModel(todoRepo);
  });

  test('TodoListViewModel init', () async {
    when(todoRepo.getTodos()).thenAnswer((_) => Stream.value([
          Todo(id: 1, title: 'title1', completed: false),
          Todo(id: 2, title: 'title2', completed: true),
        ]));
    await sut.init(navigator);
    expect(sut.dataStream, isNotNull);
    final data = await sut.dataStream.first;
    expect(sut.isLoading, false);
    expect(sut.errorKey, isNull);
    expect(data.isNotEmpty, true);
    expect(data.length, 2);

    expect(data[0].id, 1);
    expect(data[0].title, 'title1');
    expect(data[0].completed, false);

    expect(data[1].id, 2);
    expect(data[1].completed, true);
    expect(data[1].title, 'title2');

    verify(todoRepo.getTodos()).calledOnce();
    verifyNoMoreInteractions(todoRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      when(todoRepo.getTodos()).thenAnswer((_) => Stream.value([
            Todo(id: 1, title: 'title1', completed: false),
            Todo(id: 2, title: 'title2', completed: true),
          ]));
      await sut.init(navigator);
      reset(todoRepo);
      reset(navigator);
    });

    test('TodoListViewModel onAddClicked', () async {
      sut.onAddClicked();
      verify(navigator.goToAddTodo()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(todoRepo);
    });
    test('TodoListViewModel setTodoState', () async {
      await sut.onTodoChanged(id: 1, value: true);
      verify(todoRepo.setTodoState(id: 1, value: true)).calledOnce();
      verifyNoMoreInteractions(todoRepo);
      verifyZeroInteractions(navigator);
    });
    group('onDownloadClicked', () {
      test('TodoListViewModel onDownloadClicked', () async {
        expect(sut.isLoading, false);
        expect(sut.errorKey, isNull);
        await sut.onDownloadClicked();
        verify(todoRepo.fetchTodos()).calledOnce();
        expect(sut.isLoading, false);
        expect(sut.errorKey, isNull);
        verifyNoMoreInteractions(todoRepo);
        verifyZeroInteractions(navigator);
      });
      test('TodoListViewModel onDownloadClicked with FlutterTemplateError', () async {
        when(todoRepo.fetchTodos()).thenThrow(GeneralError());
        expect(sut.isLoading, false);
        expect(sut.errorKey, isNull);
        await sut.onDownloadClicked();
        verify(todoRepo.fetchTodos()).calledOnce();
        expect(sut.isLoading, false);
        expect(sut.errorKey, LocalizationKeys.errorGeneral);
        verifyNoMoreInteractions(todoRepo);
        verifyZeroInteractions(navigator);
      });
      test('TodoListViewModel onDownloadClicked with no FlutterTemplateError', () async {
        when(todoRepo.fetchTodos()).thenThrow(ArgumentError());
        expect(sut.isLoading, false);
        expect(sut.errorKey, isNull);
        await sut.onDownloadClicked();
        verify(todoRepo.fetchTodos()).calledOnce();
        expect(sut.isLoading, false);
        expect(sut.errorKey, LocalizationKeys.errorGeneral);
        verifyNoMoreInteractions(todoRepo);
        verifyZeroInteractions(navigator);
      });
    });
  });
}

class MockTodoListNavigator extends Mock implements TodoListViewNavigator {}
