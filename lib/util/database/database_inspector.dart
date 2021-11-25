import 'package:drift_inspector/drift_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:get_it/get_it.dart';

Future<void> addDatabaseInspector() async {
  if (!kDebugMode) return;

  final database = GetIt.I<FlutterTemplateDatabase>();

  final driftInspectorBuilder = DriftInspectorBuilder()
    ..bundleId = 'com.icapps.flutter_template'
    ..icon = 'flutter'
    ..addDatabase('flutter_template', database);

  final inspector = driftInspectorBuilder.build();

  await inspector.start();

  // ignore: avoid_print
  print('Started moor inspector');
}
