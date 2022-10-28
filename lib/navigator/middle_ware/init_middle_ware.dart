import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';

Future<void> initMiddleWare() async {
  await getIt<AuthStorage>().hasLoggedInUser();
}
