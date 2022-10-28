import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/exceptions/general_network_error.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/todo/todo_repository.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/injectable_test.mocks.dart';
import '../../../di/test_injectable.dart';
import '../../../util/test_extensions.dart';

void main() {
  late TodoListViewModel sut;
  late MockTodoRepository todoRepo;
  late MainNavigator navigator;

  setUp(() async {
    await initTestInjectable();
    todoRepo = getIt.resolveAs<TodoRepository, MockTodoRepository>();
    navigator = MockMainNavigator();
    sut = TodoListViewModel(todoRepo, navigator);
  });

  test('TodoListViewModel init', () async {
    when(todoRepo.getTodos()).thenAnswer((_) => Stream.value([
          const Todo(id: 1, title: 'title1', completed: false),
          const Todo(id: 2, title: 'title2', completed: true),
        ]));
    await sut.init();
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
            const Todo(id: 1, title: 'title1', completed: false),
            const Todo(id: 2, title: 'title2', completed: true),
          ]));
      await sut.init();
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
        when(todoRepo.fetchTodos()).thenAnswer((_) => Future.value([
              const Todo(id: 1, title: 'title1', completed: false),
              const Todo(id: 2, title: 'title2', completed: true),
            ]));

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
