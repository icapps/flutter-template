import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'test_injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initTestGetIt',
  generateForDir: ['test'],
)
Future<void> initTestInjectable() async {
  if (FlavorConfig.instance == null) {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.TEST,
      name: 'test',
      color: Colors.black,
      values: values,
    );
    TestWidgetsFlutterBinding.ensureInitialized();
    await $initGetIt(getIt, environment: Environment.test);
    $initTestGetIt(getIt, environment: Environment.test);
  }
}
