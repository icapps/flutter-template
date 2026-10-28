import 'package:flutter/widgets.dart';

class LifecycleUtil {
  static bool get appIsInBackground {
    final state = WidgetsBinding.instance.lifecycleState;

    return state == AppLifecycleState.paused || state == AppLifecycleState.hidden;
  }
}
