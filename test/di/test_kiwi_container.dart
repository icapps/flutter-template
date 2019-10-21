import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'test_injector.dart';

class TestKiwiContainer {
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
  }
}
