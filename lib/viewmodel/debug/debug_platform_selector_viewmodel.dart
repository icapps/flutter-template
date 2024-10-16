import 'package:flutter/foundation.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugPlatformSelectorViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final GlobalViewModel _globalViewModel;

  TargetPlatform? get selectedPlatform => _globalViewModel.targetPlatform;

  DebugPlatformSelectorViewModel(
    this._globalViewModel,
    this._navigator,
  );

  void onBackClicked() => _navigator.goBack();

  void setSelectedPlatformToDefault() => _globalViewModel.setSelectedPlatformToDefault();

  void setSelectedPlatformToAndroid() => _globalViewModel.setSelectedPlatformToAndroid();

  void setSelectedPlatformToIOS() => _globalViewModel.setSelectedPlatformToIOS();
}
