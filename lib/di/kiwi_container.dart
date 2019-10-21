import 'package:flutter_template/di/injector.dart';
import 'package:kiwi/kiwi.dart';

class KiwiContainer {
  static T resolve<T>({String name}) {
    if (name == null) {
      return Container().resolve<T>(name);
    }
    return Container().resolve<T>();
  }

  static Future<void> init() async {
    await setupDependencyTree();
  }
}
