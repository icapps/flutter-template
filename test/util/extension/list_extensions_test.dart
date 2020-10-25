import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/util/extension/list_extensions.dart';

import '../../di/test_kiwi_util.dart';

void main() {
  setUp(() async => TestKiwiUtil.init());

  test('ListExtExtension replace all', () async {
    final list = ['B', 'D', 'C', 'Z', 'A', null];
    final list2 = ['B2', 'D2'];
    final testList = <String>[]..addAll(list);
    expect(testList.length, 6);
    testList.replaceAll(list2);
    expect(testList.length, 2);
  });
  test('ListExtExtension should sort list', () async {
    final list = ['B', 'D', 'C', 'Z', 'A', null];
    expect(list.length, 6);
    list.sortBy((it) => it);
    expect(list.length, 6);
    expect(list[0], null);
    expect(list[1], 'A');
    expect(list[2], 'B');
    expect(list[3], 'C');
    expect(list[4], 'D');
    expect(list[5], 'Z');
  });

  test('ListExtExtension should return sorted list', () async {
    final list = ['B', 'D', 'C', 'Z', 'A'];
    expect(list.length, 5);
    final sortedList = list.sortedBy((it) => it);
    expect(sortedList.length, 5);
    expect(sortedList[0], 'A');
    expect(sortedList[1], 'B');
    expect(sortedList[2], 'C');
    expect(sortedList[3], 'D');
    expect(sortedList[4], 'Z');
  });
  test('ListExtExtension should return sorted list', () async {
    final list = [
      _TestObjectWith2Fields('Koen', 24),
      _TestObjectWith2Fields('Ruddy', 50),
      _TestObjectWith2Fields('Ruddy', 24),
      _TestObjectWith2Fields('Koen', 61),
    ];
    expect(list.length, 4);
    list.sortBy2Field((it) => it.name, (it) => it.age);
    expect(list.length, 4);
    expect(list[0].name, 'Koen');
    expect(list[0].age, 24);
    expect(list[1].name, 'Koen');
    expect(list[1].age, 61);
    expect(list[2].name, 'Ruddy');
    expect(list[2].age, 24);
    expect(list[3].name, 'Ruddy');
    expect(list[3].age, 50);
  });

  test('ListExtension should sort null values', () async {
    final obj1 = _TestObject();
    final obj2 = _TestObject()..name = 'Abc';

    final list = [obj1, obj2];
    expect(list.length, 2);
    list.sortBy((it) => it.name);
    expect(list.length, 2);
    expect(list[0].name, null);
    expect(list[1].name, 'Abc');
  });
}

class _TestObject {
  String name;
}

class _TestObjectWith2Fields {
  String name;
  int age;

  _TestObjectWith2Fields(this.name, this.age);
}
