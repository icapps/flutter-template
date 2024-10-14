import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';

// If you want to use web workers, see https://drift.simonbinder.eu/web/
Future<DatabaseConnection> createDriftDatabaseConnection(String name) async {
  final executor = await WasmDatabase.open(
    databaseName: 'local_db',
    sqlite3Uri: Uri.parse('sqlite3.wasm'),
    driftWorkerUri: Uri.parse('drift_worker.dart.js'),
  );

  if (executor.missingFeatures.isNotEmpty) {
    FlutterTemplateLogger.logDebug('Using ${executor.chosenImplementation} due to missing browser features: ${executor.missingFeatures}');
  }

  return DatabaseConnection(executor.resolvedExecutor);
}
