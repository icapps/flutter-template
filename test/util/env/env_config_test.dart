import 'package:flutter_template/util/env/env_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';

void main() {

  setUp(() async {
    await TestKiwiUtil.init();
  });

  test('EnvUtils should have the correct build mode', () {
    expect(EnvUtils.currentBuildMode(), BuildMode.DEBUG);
  });

  test('EnvUtils should be in debug', () {
    expect(EnvUtils.isDebug(), true);
  });

  test('EnvUtils should not be release', () {
    expect(EnvUtils.isRelease(), false);
  });

  test('EnvUtils should be not be profile', () {
    expect(EnvUtils.isProfile(), false);
  });
}