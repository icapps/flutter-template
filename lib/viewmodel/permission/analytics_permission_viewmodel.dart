import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:get/get.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher_string.dart';

@injectable
class AnalyticsPermissionViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;

  final LocalStorage _localStorage;

  AnalyticsPermissionViewModel(this._navigator, this._localStorage);

  Future<void> onAcceptClicked() async {
    await _localStorage.updateHasAnalyticsPermission(true);
    if (Get.global(null).currentState?.canPop() == true) {
      _navigator.goBack<void>();
    } else {
      // No NavigatorState to go back to, so we just go to the home screen
      _navigator.goToHome();
    }
  }

  Future<void> onMoreInfoClicked() async {
    await launchUrlString('https://www.example.com/privacy-policy');
  }
}
