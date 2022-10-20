import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IsInTest', () {
    setUp(() {
      FlavorConfig(
        flavor: Flavor.test,
        color: Colors.purple,
        name: 'Test',
        supportsTheming: true,
        values: const FlavorValues(
          baseUrl: 'base_url',
          logNetworkInfo: false,
          showFullErrorMessages: false,
        ),
      );
    });

    test('ThemeDurations should have the correct short animation duration', () {
      expect(ThemeDurations.shortAnimationDuration(), const Duration(milliseconds: 1));
    });

    test('ThemeDurations should have the correct medium animation duration', () {
      expect(ThemeDurations.mediumAnimationDuration(), const Duration(milliseconds: 1));
    });

    test('ThemeDurations should have the correct long animation duration', () {
      expect(ThemeDurations.longAnimationDuration(), const Duration(milliseconds: 1));
    });

    test('ThemeDurations should have the correct splash animation duration', () {
      expect(ThemeDurations.splashAnimationDuration(), const Duration(milliseconds: 1));
    });

    test('ThemeDurations should have the correct demo network duration', () {
      expect(ThemeDurations.demoNetworkCallDuration(), const Duration(milliseconds: 1));
    });
  });

  group('IsNotInTest', () {
    setUp(() {
      FlavorConfig(
        flavor: Flavor.dummy,
        color: Colors.purple,
        name: 'Test',
        supportsTheming: true,
        values: const FlavorValues(
          baseUrl: 'base_url',
          logNetworkInfo: false,
          showFullErrorMessages: false,
        ),
      );
    });

    test('ThemeDurations should have the correct short animation duration', () {
      expect(ThemeDurations.shortAnimationDuration(), const Duration(milliseconds: 200));
    });

    test('ThemeDurations should have the correct medium animation duration', () {
      expect(ThemeDurations.mediumAnimationDuration(), const Duration(milliseconds: 350));
    });

    test('ThemeDurations should have the correct long animation duration', () {
      expect(ThemeDurations.longAnimationDuration(), const Duration(milliseconds: 500));
    });

    test('ThemeDurations should have the correct splash animation duration', () {
      expect(ThemeDurations.splashAnimationDuration(), const Duration(seconds: 1, milliseconds: 500));
    });

    test('ThemeDurations should have the correct demo network duration', () {
      expect(ThemeDurations.demoNetworkCallDuration(), const Duration(milliseconds: 800));
    });
  });
}
