import 'package:kiwi/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

import '../util/test_util.dart';
import 'test_injector.dart';

class TestKiwiUtil {
  static Future<void> init() async {
    KiwiContainer().clear();

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
    await setupDependencyTree();
    await TestUtil.loadFonts();
  }

  static void register<T>(T singleton) {
    KiwiContainer().registerSingleton((c) => singleton);
  }

  static void registerAs<S>(S singleton) {
    KiwiContainer().registerSingleton<S>((c) => singleton);
  }

  static T resolve<T>() => KiwiContainer().resolve<T>();

  static T resolveAs<S, T extends S>() => KiwiContainer().resolveAs<S, T>();
}
