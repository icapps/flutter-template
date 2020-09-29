import 'package:flutter/src/foundation/platform.dart';
import 'package:flutter_template/repository/debug/debug_repo.dart';
import 'package:mockito/mockito.dart';

class MockDebugRepository extends Mock implements DebugRepo {
  String _platform;

  @override
  TargetPlatform getTargetPlatform() {
    if (_platform == null) return null;
    if (_platform == 'ios') return TargetPlatform.iOS;
    return TargetPlatform.android;
  }

  @override
  Future<void> saveSelectedPlatform(String selectedPlatform) {
    _platform = selectedPlatform;
    return Future(() => null);
  }
}
