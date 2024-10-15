import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:log_to_secure_file/log_to_secure_file.dart';

@injectable
class LogsViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final SecureLogStorage _secureLogStorage;

  final List<DateTime> _dates = [];

  List<DateTime> get availableDates => _dates;

  LogsViewModel(
    this._navigator,
    this._secureLogStorage,
  );

  Future<void> init() async {
    staticLogger.d('LogsViewModel init');
    _dates.replaceAll(await _secureLogStorage.availableDates());
    if (disposed) return;
    notifyListeners();
  }

  void onLogTapped(DateTime date) => _navigator.goToLogDetailScreen(date: date.toIso8601String());
}
