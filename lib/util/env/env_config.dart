enum BuildMode {
  DEBUG,
  PROFILE,
  RELEASE,
}

class EnvUtils {
  EnvUtils._();

  static BuildMode currentBuildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.RELEASE;
    }
    var result = BuildMode.PROFILE;
    //Little trick, since assert only runs on DEBUG mode
    assert(() {
      result = BuildMode.DEBUG;
      return true;
    }());
    return result;
  }

  static bool isDebug() {
    return currentBuildMode() == BuildMode.DEBUG;
  }

  static bool isRelease() {
    return currentBuildMode() == BuildMode.RELEASE;
  }

  static bool isProfile() {
    return currentBuildMode() == BuildMode.PROFILE;
  }
}
