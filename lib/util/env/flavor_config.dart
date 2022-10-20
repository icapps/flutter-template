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
  final bool isThemingSupported;
  ThemeMode themeMode;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required Color color,
    required FlavorValues values,
    required bool supportsTheming,
    ThemeMode themeMode = ThemeMode.system,
  }) =>
      _instance = FlavorConfig._internal(flavor, name, color, values, supportsTheming, themeMode);

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values, this.isThemingSupported, this.themeMode);

  static FlavorConfig get instance => _instance!;

  static bool get hasInstance => _instance != null;

  static bool isProd() => _instance!.flavor == Flavor.prod;

  static bool isDev() => _instance!.flavor == Flavor.dev;

  static bool isAlpha() => _instance!.flavor == Flavor.alpha;

  static bool isBeta() => _instance!.flavor == Flavor.beta;

  static bool isInTest() => _instance!.flavor == Flavor.test;

  static bool isDummy() => _instance!.flavor == Flavor.dummy;
}
