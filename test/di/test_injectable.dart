import 'package:connectivity/connectivity.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

Future<void> initTestInjectable() async {
  if (!getIt.isRegistered<Connectivity>()) {
    TestWidgetsFlutterBinding.ensureInitialized();
    await $initGetIt(getIt, environment: Environment.test);
  }
}
