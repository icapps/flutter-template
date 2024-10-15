import 'package:flutter_template/di/injectable.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:log_to_secure_file/log_to_secure_file.dart';
import 'package:synchronized/synchronized.dart';

class LoggingUtil {
  static final _loggerLock = Lock();

  static void startLogging() {
    final fileLogger = getIt.get<SecureLogStorage>();
    fileLogger.init();
    LoggingFactory.configure(LoggingConfiguration(onLog: (value) => storeLogLine(value)));
  }

  static void storeLogLine(String line) => _loggerLock.synchronized(() => getIt.get<SecureLogStorage>().storeLogLine(line));
}
