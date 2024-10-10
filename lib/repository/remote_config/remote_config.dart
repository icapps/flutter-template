import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/data/remote_config/localized_message.dart';
import 'package:flutter_template/repository/remote_config/remote_config_repository.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfig {
  static RemoteConfigRepository? get _remoteConfig => FlavorConfig.isInTest() ? null : getIt();

  int get minimumBuild => _remoteConfig?.getOptionalInt('minimum_build') ?? 1;

  int get latestBuild => _remoteConfig?.getOptionalInt('latest_build') ?? 1;

  int get reviewBuild => _remoteConfig?.getOptionalInt('review_build') ?? 1;

  Map<String, LocalizedMessage> get overriddenTranslations => _remoteConfig?.getCustomObjectMap('overridden_translations', LocalizedMessage.fromJson) ?? {};
}
