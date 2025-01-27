import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Flavor {
  test,
  dummy,
  dev, //We use DEV instead of DEBUG because android already has a release type Debug.
  alpha,
  beta,
  prod,
}

class FlavorValues {
  final String baseUrl;
  final bool logNetworkInfo;
  final bool showFullErrorMessages;

  const FlavorValues({
    required this.baseUrl,
    required this.logNetworkInfo,
    required this.showFullErrorMessages,
  });
}

class FlavorConfig {
  double devicePixelRatio = 1;
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required Color color,
    required FlavorValues values,
  }) =>
      _instance = FlavorConfig._internal(flavor, name, color, values);

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance => _instance!;

  static bool get hasInstance => _instance != null;

  static bool isProd() => _instance!.flavor == Flavor.prod;

  static bool isDev() => _instance!.flavor == Flavor.dev;

  static bool isAlpha() => _instance!.flavor == Flavor.alpha;

  static bool isBeta() => _instance!.flavor == Flavor.beta;

  static bool isInTestEnv() => _instance!.flavor == Flavor.test;

  static bool isInTest() => kIsWeb ? isInTestEnv() : Platform.environment.containsKey('FLUTTER_TEST');

  static bool isDummy() => _instance!.flavor == Flavor.dummy;
}
