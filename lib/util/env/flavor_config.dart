import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum Flavor {
  TEST,
  DUMMY,
  DEV,
  ALPHA,
  BETA,
  PRODUCTION,
}

class FlavorValues {
  final String baseUrl;
  final bool logNetworkInfo;

  const FlavorValues({@required this.baseUrl, @required this.logNetworkInfo});
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

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;

  static bool isDev() => _instance.flavor == Flavor.DEV;

  static bool isAlpha() => _instance.flavor == Flavor.ALPHA;

  static bool isBeta() => _instance.flavor == Flavor.BETA;

  static bool isInTest() => _instance.flavor == Flavor.TEST;

  static bool isDummy() => _instance.flavor == Flavor.DUMMY;
}
