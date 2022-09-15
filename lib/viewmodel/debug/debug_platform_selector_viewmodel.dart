import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugPlatformSelectorViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;

  DebugPlatformSelectorViewModel(this._navigator);

  Future<void> init() async {}

  void onBackClicked() => _navigator.goBack<void>();
}
