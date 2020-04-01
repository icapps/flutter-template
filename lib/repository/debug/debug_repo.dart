import 'package:flutter/widgets.dart';

abstract class DebugRepo {
  Future<void> saveSlowAnimations({@required bool enabled});

  bool isSlowAnimationsEnabled();

  Future<void> saveSelectedPlatform(String selectedPlatform);

  TargetPlatform getTargetPlatform();
}
