import 'package:flutter_template/remote_config/remote_config_base.dart';

class RemoteConfigData {
  RemoteConfigData({
    required this.testParameter,
    required this.sendBlockedErrorsToFirebase,
    required this.reviewBuild,
    required this.latestBuild,
    required this.minimumBuild,
  });

  factory RemoteConfigData.fromRemoteConfig(RemoteConfigBase remoteConfigBase) {
    return RemoteConfigData(
        testParameter:
            remoteConfigBase.getOptionalString('test_parameter') ?? 'test',
        sendBlockedErrorsToFirebase: remoteConfigBase
                .getOptionalBool('send_blocked_errors_to_firebase') ??
            false,
        reviewBuild: remoteConfigBase.getOptionalDouble('review_build') ?? 1,
        latestBuild: remoteConfigBase.getOptionalDouble('latest_build') ?? 2,
        minimumBuild: remoteConfigBase.getOptionalDouble('minimum_build') ?? 1);
  }

  final String testParameter;

  final bool sendBlockedErrorsToFirebase;

  final double reviewBuild;

  final double latestBuild;

  final double minimumBuild;
}
