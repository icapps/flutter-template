import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_util.dart';

void main() {
  group('FlavorValues', () {
    test('FlavorValues should be correctly initialized', () {
      const config = FlavorValues(
        baseUrl: 'https://url.com/',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      );
      expect(config.baseUrl, 'https://url.com/');
      expect(config.logNetworkInfo, false);
    });
  });

  group('FlavorConfig TEST', () {
    FlavorValues values;

    setUp(() {
      values = FlavorValues(
        baseUrl: 'http://${TestUtil.getVariableString()}',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      );
      FlavorConfig(
        flavor: Flavor.test,
        name: 'flavor_config_test',
        color: Colors.amber,
        supportsTheming: true,
        values: values,
      );
    });

    test('FlavorConfig instance should be correct', () {
      expect(FlavorConfig.instance, isNotNull);
      expect(FlavorConfig.instance.values.logNetworkInfo, false);
      expect(FlavorConfig.instance.values.baseUrl, 'http://${TestUtil.getVariableString()}');
      expect(FlavorConfig.instance.flavor, Flavor.test);
      expect(FlavorConfig.instance.name, 'flavor_config_test');
      expect(FlavorConfig.instance.color, Colors.amber);
    });

    test('FlavorConfig is not in production', () {
      expect(FlavorConfig.isProd(), false);
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
