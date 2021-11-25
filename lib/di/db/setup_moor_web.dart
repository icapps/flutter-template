import 'package:drift/drift.dart';
import 'package:drift/web.dart';

// If you want to use web workers, see https://moor.simonbinder.eu/web/
Future<DatabaseConnection> createMoorDatabaseConnection(String name) async {
  return DatabaseConnection.fromExecutor(WebDatabase.withStorage(await DriftWebStorage.indexedDbIfSupported(name)));
}
