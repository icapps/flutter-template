import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:get_it/get_it.dart';

Future<void> initMiddleWare() async {
  await GetIt.I<AuthStorage>().hasLoggedInUser();
}
