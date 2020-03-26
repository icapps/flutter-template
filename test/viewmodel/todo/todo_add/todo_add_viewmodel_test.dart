import 'dart:math';

import 'package:flutter_template/model/exceptions/code_error.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/general_network_error.dart';
import 'package:flutter_template/model/exceptions/network_error.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../mocks/repository/todo/mock_todo_repository.dart';
import '../../../util/test_extensions.dart';

void main() {
  TodoAddViewModel sut;
  MockTodoRepository todoRepo;
  MockTodoAddNavigator navigator;

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
      verify(navigator.goBack()).calledOnce();
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
        verify(navigator.goBack()).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });
      test('TodoAddViewModel onSaveClicked with update', () async {
        await sut.onTodoChanged('mytodo');
        await sut.onSaveClicked();
        verify(todoRepo.saveTodo('mytodo')).calledOnce();
        verify(navigator.goBack()).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });
      test('TodoAddViewModel onSaveClicked with update with spaces', () async {
        await sut.onTodoChanged('  mytodo  ');
        await sut.onSaveClicked();
        verify(todoRepo.saveTodo('mytodo')).calledOnce();
        verify(navigator.goBack()).calledOnce();
        verifyNoMoreInteractions(todoRepo);
        verifyNoMoreInteractions(navigator);
      });
    });
  });
}

class MockTodoAddNavigator extends Mock implements TodoAddNavigator {}
