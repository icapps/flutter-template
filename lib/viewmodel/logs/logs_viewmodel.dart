import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:flutter_template/util/logging/log_types.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:log_to_secure_file/log_to_secure_file.dart';

enum LogLevel {
  error,
  fatal,
  warning,
  info,
  debug,
}

@injectable
class LogsViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final SecureLogStorage _secureLogStorage;

  final List<DateTime> _dates = [];

  List<DateTime> get availableDates => _dates;

  List<LogLevel> get availableLogLevels => LogLevel.values;

  LogsViewModel(
    this._navigator,
    this._secureLogStorage,
  );

  Future<void> init() async {
    _dates.replaceAll(await _secureLogStorage.availableDates());
    if (disposed) return;
    notifyListeners();
  }

  void triggerLog(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        FlutterTemplateLogger.logDebug('Debug', type: LogType.logs);
        break;
      case LogLevel.info:
        FlutterTemplateLogger.logInfo('Info', type: LogType.logs);
        break;
      case LogLevel.warning:
        FlutterTemplateLogger.logWarning('Warning', type: LogType.logs);
        break;
      case LogLevel.fatal:
        FlutterTemplateLogger.logFatal('Fatal', type: LogType.logs);
        break;
      case LogLevel.error:
        FlutterTemplateLogger.logError('Error', error: Exception('This is a test error'), stackTrace: StackTrace.current, type: LogType.logs);
        break;
    }
  }

  void triggerError() {
    try {
      throw Exception('This is a test error');
    } catch (e, trace) {
      FlutterTemplateLogger.logError(
        'Error',
        error: e,
        stackTrace: trace,
        sendToFirebase: false,
      );
    }
  }

  void onLogTapped(DateTime date) => _navigator.goToLogDetailScreen(date: date.toIso8601String());
}
