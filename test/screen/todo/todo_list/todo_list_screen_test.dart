import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../di/test_kiwi_util.dart';
import '../../../mocks/viewmodel/todo/todo_list/mock_todo_list_viewmodel.dart';
import '../../../util/test_extensions.dart';
import '../../../util/test_util.dart';
import '../../seed.dart';

void main() {
  setUp(() async {
    await TestKiwiUtil.init();
  });

  testWidgets('Test splash screen initial state', (tester) async {
    seedTodoListViewModel();
    seedGlobalViewModel();

    const sut = TodoListScreen();
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'todo_list_screen_inital_state');
    verifyTodoListViewModel();
    verifyGlobalViewModel();
  });
}

void verifyTodoListViewModel() {
  final licenseViewModel = TestKiwiUtil.resolveAs<TodoListViewModel, MockTodoListViewModel>();
  verify(licenseViewModel.dataStream);
  verify(licenseViewModel.isLoading);
  verify(licenseViewModel.errorKey);
  verify(licenseViewModel.init(any)).calledOnce();
  verifyNoMoreInteractions(licenseViewModel);
}
