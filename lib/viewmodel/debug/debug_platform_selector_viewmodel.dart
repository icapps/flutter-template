import 'package:flutter_template/navigator/mixin/back_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugPlatformSelectorViewModel with ChangeNotifierEx {
  late DebugPlatformSelectorNavigator _navigator;

  Future<void> init(DebugPlatformSelectorNavigator navigator) async {
    _navigator = navigator;
  }

  void onBackClicked() => _navigator.goBack<void>();
}

abstract class DebugPlatformSelectorNavigator implements BackNavigator {}
