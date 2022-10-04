import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/license.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LicenseViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;

  LicenseViewModel(this._navigator);

  List<License> get licenses => LicenseUtil.getLicenses();

  void onBackClicked() => _navigator.goBack<void>();
}
