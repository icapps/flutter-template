import 'package:flutter/material.dart';
import 'package:flutter_template/widget/user/user_row.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_container.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  testWidgets('Test user row in default state', (tester) async {
    final widget = UserRow(
      title: 'Title',
      subtitleIcon: Icons.person,
      subtitle: 'House',
      titleIcon: Icons.home,
      onClick: () {},
    );
    await TestUtil.snapshotTestWidgetWithLocaleWrapper(tester, widget, 'user_row_default');
  });
}
