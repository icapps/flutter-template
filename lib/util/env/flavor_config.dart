import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum Flavor {
  TEST,
  DUMMY,
  DEV, //We use DEV instead of DEBUG because android already has a release type Debug.
  ALPHA,
  BETA,
  PROD,
}

class FlavorValues {
  final String baseUrl;
  final bool logNetworkInfo;
  final bool showFullErrorMessages;

  const FlavorValues({
    @required this.baseUrl,
    @required this.logNetworkInfo,
    @required this.showFullErrorMessages,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    @required String name,
    @required Color color,
    @required FlavorValues values,
  }) =>
      _instance = FlavorConfig._internal(flavor, name, color, values);

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance => _instance;

  static bool isProd() => _instance.flavor == Flavor.PROD;

  static bool isDev() => _instance.flavor == Flavor.DEV;

  static bool isAlpha() => _instance.flavor == Flavor.ALPHA;

  static bool isBeta() => _instance.flavor == Flavor.BETA;

  static bool isInTest() => _instance.flavor == Flavor.TEST;

  static bool isDummy() => _instance.flavor == Flavor.DUMMY;
}
