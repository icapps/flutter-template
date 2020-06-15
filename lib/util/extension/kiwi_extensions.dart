import 'package:flutter_template/di/injector.dart';
import 'package:kiwi/kiwi.dart';

extension KiwiExtensions on KiwiContainer {
  Future<void> init() async {
    await setupDependencyTree();
  }
}
