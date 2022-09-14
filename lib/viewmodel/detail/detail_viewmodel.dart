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
    _id = Get.parameters['id'] as String;
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
