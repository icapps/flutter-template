import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/data/remote_config/localized_message.dart';
import 'package:flutter_template/remote_config/remote_config_base.dart';
import 'package:flutter_template/remote_config/remote_config_keys.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/locale/localization_overrides.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfig extends RemoteConfigBase {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfig(this._remoteConfig);

  @override
  @protected
  Future<void> refreshRemoteConfig() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: ThemeDurations.remoteConfigTimeOut,
        minimumFetchInterval: Duration.zero,
      ),
    );
    try {
      await _remoteConfig.fetchAndActivate();
      await getIt.get<LocalizationOverrides>().refreshOverrideLocalizations();
    } catch (error, trace) {
      FlutterTemplateLogger.logError('Unable to fetch remote config. Cached or default values will be used', error: error, stackTrace: trace);
    }
  }

  @override
  @protected
  String? getOptionalValue(String key) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    if (remoteConfig.getAll().containsKey(key)) return remoteConfig.getValue(key).asString();
    return null;
  }

  Map<String, LocalizedMessage> get overriddenTranslations => getCustomObjectMap(RemoteConfigKeys.overriddenTranslations, LocalizedMessage.fromJson);
}
