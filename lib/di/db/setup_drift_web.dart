import 'package:drift/drift.dart';
import 'package:drift/web.dart';

// If you want to use web workers, see https://drift.simonbinder.eu/web/
Future<DatabaseConnection> createDriftDatabaseConnection(String name) async {
  return DatabaseConnection(WebDatabase.withStorage(await DriftWebStorage.indexedDbIfSupported(name)));
}
