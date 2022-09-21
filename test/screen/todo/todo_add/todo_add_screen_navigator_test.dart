import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/injectable_test.mocks.dart';
import '../../../di/test_injectable.dart';
import '../../../util/test_extensions.dart';
import '../../seed.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test todo add screen navigator', (tester) async {
    seedTodoAddViewModel();
    seedGlobalViewModel();

    final mainNavigator = MockMainNavigator();
    final todoRepo = MockTodoRepository();
    final sut = TodoAddViewModel(todoRepo, mainNavigator);

    sut.onBackClicked();
    verify(mainNavigator.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mainNavigator);

    await sut.onSaveClicked();
    verify(mainNavigator.showError('Todo should not be empty')).calledOnce();
    verifyNoMoreInteractions(mainNavigator);

    sut.onTodoChanged('todo');
    await sut.onSaveClicked();
    verify(mainNavigator.goBack<void>()).calledOnce();
    verifyNoMoreInteractions(mainNavigator);
  });
}
