import 'package:flutter_template/repository/logging/logging_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:log_to_secure_file/log_to_secure_file.dart';

@injectable
class LogDetailViewModel with ChangeNotifierEx {
  late final DateTime _date;
  final SecureLogStorage _secureLogStorage;
  final LoggingRepository _loggingRepository;

  final List<String> _logs = [];

  bool _isLoading = false;

  List<String> get logs => _logs;

  bool get isLoading => _isLoading;

  LogDetailViewModel(
    this._secureLogStorage,
    this._loggingRepository,
  );

  Future<void> init(String date) async {
    _date = DateTime.parse(date);
    _logs.replaceAll(await _secureLogStorage.getLogFromDate(_date));
    if (disposed) return;
    notifyListeners();
  }

  Future<void> uploadLog() async {
    _isLoading = true;
    notifyListeners();
    await _loggingRepository.uploadLog(_date);
    if (disposed) return;
    notifyListeners();
  }
}
