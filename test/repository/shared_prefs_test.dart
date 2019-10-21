import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/repository/shared_prefs.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_container.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  test('Test Shared prefs save/get String', () async {
    final sharedPrefs = KiwiContainer.resolve<SharedPrefs>();

    await sharedPrefs.saveString('Key', 'value');
    final value = sharedPrefs.getString('Key');
    expect('value', value);

    await sharedPrefs.saveString('Key2', 'value2');
    final value2 = sharedPrefs.getString('Key2');
    expect('value2', value2);

    final originalValue = sharedPrefs.getString('Key');
    expect('value', originalValue);
  });

  test('Test Shared prefs save/get Boolean', () async {
    final sharedPrefs = KiwiContainer.resolve<SharedPrefs>();

    await sharedPrefs.saveBoolean('Key', true);
    final value = sharedPrefs.getBoolean('Key');
    expect(true, value);

    await sharedPrefs.saveBoolean('Key2', false);
    final value2 = sharedPrefs.getBoolean('Key2');
    expect(false, value2);

    final originalValue = sharedPrefs.getBoolean('Key');
    expect(true, originalValue);
  });

  test('Test Shared prefs save/get Int', () async {
    final sharedPrefs = KiwiContainer.resolve<SharedPrefs>();

    await sharedPrefs.saveInt('Key', 1);
    final value = sharedPrefs.getInt('Key');
    expect(1, value);

    await sharedPrefs.saveInt('Key2', 2);
    final value2 = sharedPrefs.getInt('Key2');
    expect(2, value2);

    final originalValue = sharedPrefs.getInt('Key');
    expect(1, originalValue);
  });

  test('Test Shared prefs save/get Double', () async {
    final sharedPrefs = KiwiContainer.resolve<SharedPrefs>();

    await sharedPrefs.saveDouble('Key', 1.4878);
    final value = sharedPrefs.getDouble('Key');
    expect(1.4878, value);

    await sharedPrefs.saveDouble('Key2', 2.52123);
    final value2 = sharedPrefs.getDouble('Key2');
    expect(2.52123, value2);

    final originalValue = sharedPrefs.getDouble('Key');
    expect(1.4878, originalValue);
  });

  test('Test Shared prefs delete key', () async {
    final sharedPrefs = KiwiContainer.resolve<SharedPrefs>();

    await sharedPrefs.saveDouble('Key', 1.4878);
    final value = sharedPrefs.getDouble('Key');
    expect(1.4878, value);

    await sharedPrefs.deleteKey('Key');
    final valueAfterDelete = sharedPrefs.getDouble('Key');
    expect(null, valueAfterDelete);
  });
}
