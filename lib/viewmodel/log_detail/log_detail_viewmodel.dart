import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:log_to_secure_file/log_to_secure_file.dart';

@injectable
class LogDetailViewModel with ChangeNotifierEx {
  late final DateTime _date;
  final SecureLogStorage _secureLogStorage;

  final List<String> _logs = [];

  List<String> get logs => _logs;

  LogDetailViewModel(
    this._secureLogStorage,
  );

  Future<void> init(String date) async {
    staticLogger.d('LogDetailViewModel init');
    _date = DateTime.parse(date);
    _logs.replaceAll(await _secureLogStorage.getLogFromDate(_date));
    if (disposed) return;
    notifyListeners();
  }
}
