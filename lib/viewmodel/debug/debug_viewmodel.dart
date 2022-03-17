import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugViewModel with ChangeNotifierEx {
  final DebugRepository _debugRepo;

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

  void onThemeModeClicked() => _navigator.goToThemeModeSelector();

  void onSelectLanguageClicked() => _navigator.goToSelectLanguage();

  void onLicensesClicked() => _navigator.goToLicenses();
}

abstract class DebugNavigator {
  void goToTargetPlatformSelector();

  void goToThemeModeSelector();

  void goToSelectLanguage();

  void goToLicenses();
}
