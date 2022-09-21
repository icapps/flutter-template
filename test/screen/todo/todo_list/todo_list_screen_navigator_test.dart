import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/injectable_test.mocks.dart';
import '../../../di/test_injectable.dart';
import '../../../util/test_extensions.dart';
import '../../seed.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test todo list screen navigator', (tester) async {
    seedTodoListViewModel();
    seedGlobalViewModel();

    final mainNavigator = MockMainNavigator();
    final todoRepo = MockTodoRepository();
    final sut =TodoListViewModel(todoRepo, mainNavigator);

    sut.goToDetail();
    verify(mainNavigator.goToDetail()).calledOnce();
    verifyNoMoreInteractions(mainNavigator);

    sut.onAddClicked();
    verify(mainNavigator.goToAddTodo()).calledOnce();
    verifyNoMoreInteractions(mainNavigator);
  });
}
