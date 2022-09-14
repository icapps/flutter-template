import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/util/extension/get_extension.dart';
import 'package:flutter_template/util/snackbar/snackbar_util.dart';
import 'package:get/route_manager.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailViewModel with ChangeNotifierEx {
  String? _id;

  String? get id => _id;

  DetailViewModel();

  Future<void> init() async {
    _id = Get.parameterFromurl<String>(RouteNames.idParameter);
  }

  void showSnackBar() => showCustomSnackBar(
        title: 'test',
        message: 'description',
      );

  void showSnackBarError() => showCustomSnackBar(
        title: 'test',
        message: 'description',
        style: SnackBarStyle.error,
      );

  void showSnackBarSuccess() => showCustomSnackBar(
        title: 'test',
        message: 'description',
        style: SnackBarStyle.success,
      );
}
