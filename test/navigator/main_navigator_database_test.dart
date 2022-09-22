import 'dart:async';

import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../di/test_injectable.dart';
import '../screen/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async {
    await initTestInjectable();
  });

  testWidgets('Test main navigator widget database', (tester) async {
    seedGlobalViewModel();
    seedAuthStorage();

    final mainNavigator = MainNavigator(GetIt.I.get());
    await TestUtil.loadScreen(tester, const SizedBox.shrink());
    final db = GetIt.I<FlutterTemplateDatabase>();
    unawaited(mainNavigator.goToDatabase(db));
    await tester.pumpAndSettle();
    expect(find.byType(DriftDbViewer), findsOneWidget);
  });
}
