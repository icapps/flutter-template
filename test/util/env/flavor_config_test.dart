import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_util.dart';

void main() {
  group('FlavorValues', () {
    test('FlavorValues should be correctly initialized', () {
      const config = FlavorValues(baseUrl: 'https://url.com/', logNetworkInfo: false);
      expect(config.baseUrl, 'https://url.com/');
      expect(config.logNetworkInfo, false);
    });
  });

  group('FlavorConfig TEST', () {
    FlavorValues values;

    setUp(() {
      values = FlavorValues(baseUrl: TestUtil.getVariableString(), logNetworkInfo: false);
      FlavorConfig(flavor: Flavor.TEST, name: 'flavor_config_test', color: Colors.amber, values: values);
    });

    test('FlavorConfig instance should be correct', () {
      expect(FlavorConfig.instance, isNotNull);
      expect(FlavorConfig.instance.values.logNetworkInfo, false);
      expect(FlavorConfig.instance.values.baseUrl, 'https://url.com/');
      expect(FlavorConfig.instance.flavor, Flavor.TEST);
      expect(FlavorConfig.instance.name, 'flavor_config_test');
      expect(FlavorConfig.instance.color, Colors.amber);
    });

    test('FlavorConfig is not in production', () {
      expect(FlavorConfig.isProduction(), false);
    });

    test('FlavorConfig is not in alpha', () {
      expect(FlavorConfig.isAlpha(), false);
    });

    test('FlavorConfig is not in beta', () {
      expect(FlavorConfig.isBeta(), false);
    });

    test('FlavorConfig is not in test', () {
      expect(FlavorConfig.isInTest(), true);
    });

    test('FlavorConfig is not in dummy', () {
      expect(FlavorConfig.isDummy(), false);
    });
  });
}
