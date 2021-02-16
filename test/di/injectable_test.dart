import 'package:flutter_template/repository/login/login_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'test_injectable.dart';

void main() {
  setUp(() async => initTestInjectable());

  test('KiwiContainer', () async {
    final loginRepo = GetIt.I<LoginRepo>();
    expect(loginRepo is LoginRepo, true);
  });
}
