import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../di/test_kiwi_container.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  test('Test HomeViewModel default state', () async {
    final viewModel = KiwiContainer.resolve<HomeViewModel>();
    final mock = HomeNavigatorMockInterface();
    await viewModel.init(mock);
    expect(viewModel.getUserLength(), 0);
  });
}

class HomeNavigatorMockInterface extends Mock implements HomeNavigator {}
