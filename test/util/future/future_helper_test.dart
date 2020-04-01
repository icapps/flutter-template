import 'package:flutter_template/util/future/future_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Future helper test await2', () async {
    final future1 = Future.value(true);
    final future2 = Future.value('String');
    final items = await await2(future1, future2);
    expect(items.item1, true);
    expect(items.item2, 'String');
  });

  test('Future helper test await3', () async {
    final future1 = Future.value(true);
    final future2 = Future.value('String');
    final future3 = Future.value(1);
    final items = await await3(future1, future2, future3);
    expect(items.item1, true);
    expect(items.item2, 'String');
    expect(items.item3, 1);
  });

  test('Future helper test await4', () async {
    final future1 = Future.value(true);
    final future2 = Future.value('String');
    final future3 = Future.value(1);
    final future4 = Future.value(1.1);
    final items = await await4(future1, future2, future3, future4);
    expect(items.item1, true);
    expect(items.item2, 'String');
    expect(items.item3, 1);
    expect(items.item4, 1.1);
  });
}
