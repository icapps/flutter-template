import 'package:flutter/cupertino.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

import '../di/test_injectable.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
  });

  testWidgets('Test main navigator widget database', (tester) async {
    seedGlobalViewModel();
    final key = GlobalKey<MainNavigatorWidgetState>();
    final sut = MainNavigatorWidget(key: key);
    final db = GetIt.I<FlutterTemplateDatabase>();
    await TestUtil.loadScreen(tester, sut);
    key.currentState!.goToDatabase(db);
    await tester.pumpAndSettle();
    expect(find.byType(MoorDbViewer), findsOneWidget);
  });
}
