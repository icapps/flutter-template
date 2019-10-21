import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/repository/api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_container.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  test('Test Api from assets', () async {
    final api = KiwiContainer.resolve<Api>();

    expect(() async => api.get('never-existing-api-call'), throwsException);
  });

  test('Test Api from assets', () async {
    final api = KiwiContainer.resolve<Api>();
    final result = await api.get('users');
    expect(result, isNotNull);
  });
}
