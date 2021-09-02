import 'package:moor/moor.dart';
import 'package:moor/moor_web.dart';

// If you want to use web workers, see https://moor.simonbinder.eu/web/
Future<DatabaseConnection> createMoorDatabaseConnection(String name) async {
  return DatabaseConnection.fromExecutor(WebDatabase.withStorage(await MoorWebStorage.indexedDbIfSupported(name)));
}
