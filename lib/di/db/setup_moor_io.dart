import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<DatabaseConnection> createMoorDatabaseConnection(String name) async {
  if (FlavorConfig.isInTest()) {
    return DatabaseConnection.fromExecutor(NativeDatabase.memory());
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

  final isolate = await receivePort.first as DriftIsolate;
  return isolate.connect();
}

void _startBackground(_IsolateStartRequest request) {
  final executor = NativeDatabase(File(request.targetPath));
  final moorIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );
  request.sendMoorIsolate.send(moorIsolate);
}

class _IsolateStartRequest {
  final SendPort sendMoorIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
}
