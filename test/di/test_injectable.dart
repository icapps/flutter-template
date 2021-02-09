import 'package:flutter/material.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/di/environments.dart';
import 'package:flutter_template/di/injectable.config.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../util/test_util.dart';
import 'test_injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initTestGetIt',
  generateForDir: ['test'],
)
Future<void> initTestInjectable() async {
  await getIt.reset();
  if (FlavorConfig.instance == null) {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.TEST,
      color: Colors.purple,
      name: 'Test',
      values: values,
    );
  }
  TestWidgetsFlutterBinding.ensureInitialized();
  $initTestGetIt(getIt, environment: Environments.TEST);
  await $initGetIt(getIt, environment: Environments.TEST);
  await TestUtil.loadFonts();
}

@module
abstract class RegisterModule {
  @Environment(Environments.TEST)
  @singleton
  FlutterTemplateDatabase get flutterTemplateDatabase => FlutterTemplateDatabase(VmDatabase.memory());
}
