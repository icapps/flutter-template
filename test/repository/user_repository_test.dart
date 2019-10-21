import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_container.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  test('Test User repository check if users start empty', () async {
    final userRepo = KiwiContainer.resolve<UserRepository>();
    final users = await userRepo.getUsers();
    expect(users.length, 10);
  });
}
