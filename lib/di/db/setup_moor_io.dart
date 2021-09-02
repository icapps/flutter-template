import 'dart:io';
import 'dart:isolate';

import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:moor/ffi.dart';
import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<DatabaseConnection> createMoorDatabaseConnection(String name) async {
  if (FlavorConfig.isInTest()) {
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true; // This method is called every test :-/ TODO: figure out how to stop
    return DatabaseConnection.fromExecutor(VmDatabase.memory());
  }
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(join(dbFolder.path, '$name.sqlite'));
  if ((FlavorConfig.isDev() || FlavorConfig.isDummy()) && file.existsSync()) {
    file.deleteSync();
    staticLogger.debug('Databasefile `db.sqlite` is deleted');
  }
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, file.path),
  );

  final isolate = await receivePort.first as MoorIsolate;
  return isolate.connect();
}

void _startBackground(_IsolateStartRequest request) {
  final executor = VmDatabase(File(request.targetPath));
  final moorIsolate = MoorIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );
  request.sendMoorIsolate.send(moorIsolate);
}

class _IsolateStartRequest {
  final SendPort sendMoorIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
}
