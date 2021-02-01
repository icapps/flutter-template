import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:moor/ffi.dart';
import 'package:moor_inspector/moor_inspector.dart';

Future<void> addDatabaseInspector() async {
  final database = FlutterTemplateDatabase(VmDatabase.memory());

  final moorInspectorBuilder = MoorInspectorBuilder()
    ..bundleId = 'com.icapps.flutter_template'
    ..icon = 'flutter'
    ..addDatabase('example', database);

  final inspector = moorInspectorBuilder.build();

  await inspector.start();

  // ignore: avoid_print
  print('Starting moor inspector');
}
