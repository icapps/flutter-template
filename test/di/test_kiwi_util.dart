import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import '../util/test_util.dart';
import 'test_injector.dart';

class TestKiwiUtil {
  static Future<void> init() async {
    kiwi.Container().clear();

    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
    );
    FlavorConfig(
      flavor: Flavor.TEST,
      color: Colors.purple,
      name: 'Test',
      values: values,
    );
    await setupDependencyTree();
    await TestUtil.loadFonts();
  }

  static void register<T>(T singleton) {
    kiwi.Container().registerSingleton((c) => singleton);
  }

  static void registerAs<S, T extends S>(T singleton) {
    kiwi.Container().registerSingleton<S, T>((c) => singleton);
  }

  static T resolve<T>() => kiwi.Container().resolve<T>();

  // ignore: avoid_as
  static T resolveAs<S, T extends S>() => kiwi.Container().resolve<S>() as T;
}
