import 'dart:io';

import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:log_to_secure_file/log_to_secure_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

abstract class BaseLoggingRepository {
  final SecureLogStorage _secureLogStorage;

  BaseLoggingRepository(
    this._secureLogStorage,
  );

  final _loggerLock = Lock();

  String tempLogPath = '/logs';

  String get userId;

  void startLogging() {
    _secureLogStorage.init();
    LoggingFactory.configure(LoggingConfiguration(onLog: (value) => storeLogLine(value)));
  }

  void storeLogLine(String line) => _loggerLock.synchronized(() => _secureLogStorage.storeLogLine(line));

  Future<void> uploadLog(DateTime date) async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    final file = File('${applicationDirectory.path}$tempLogPath');
    if (file.existsSync()) {
      file.deleteSync();
      file.createSync();
    }
    final log = await _secureLogStorage.getLogFromDate(date);
    for (final line in log) {
      file.writeAsStringSync(line);
    }
    await uploadFile(file, date);
    file.deleteSync();
  }

  Future<void> uploadFile(File file, DateTime date);
}
