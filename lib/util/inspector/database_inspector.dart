import 'package:drift_local_storage_inspector/drift_local_storage_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:storage_inspector/storage_inspector.dart';

Future<void> addDatabaseInspector() async {
  if (!kDebugMode) return;

  final database = getIt.get<FlutterTemplateDatabase>();

  final driver = StorageServerDriver(
    bundleId: 'com.icapps.flutter_template',
    icon: 'flutter',
  );

  final sqlServer = DriftSQLDatabaseServer(
    id: "1", // A 'random' id for the server, just ensure you don't use the same one in the same project
    name: "SQL server", // Identification name for this database, shown in the plugin UI
    database: database,
  );

  driver.addSQLServer(sqlServer);

  await driver.start();

  // ignore: avoid_print
  print('Started drift inspector');
}
