import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template/bridge/logging/logging_bridging.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';

@injectable
class DebugViewModel with ChangeNotifierEx {
  final DebugRepo _debugRepo;

  late DebugNavigator _navigator;

  var slowAnimationsEnabled = false;

  DebugViewModel(this._debugRepo);

  Future<void> init(DebugNavigator navigator) async {
    _navigator = navigator;
    _initValues();
  }

  void _initValues() {
    slowAnimationsEnabled = _debugRepo.isSlowAnimationsEnabled();
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onSlowAnimationsChanged(bool enabled) async {
    await _debugRepo.saveSlowAnimations(enabled: enabled);
    _initValues();
  }

  void onTargetPlatformClicked() => _navigator.goToTargetPlatformSelector();

  void onSelectLanguageClicked() => _navigator.goToSelectLanguage();

  void onLicensesClicked() => _navigator.goToLicenses();

  void onLogNativeBridge() {
    GetIt.instance.get<LoggingBridging>().log('TEST From the debug screen.');
  }
}

abstract class DebugNavigator {
  void goToTargetPlatformSelector();

  void goToSelectLanguage();

  void goToLicenses();
}
