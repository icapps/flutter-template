import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_template/repository/remote_config/base_remote_config_repository.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/locale/localization_overrides.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class RemoteConfigRepository extends BaseRemoteConfigRepo {

  RemoteConfigRepository();

  @override
  Future<void> refreshRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: ThemeDurations.remoteConfigTimeOut,
        minimumFetchInterval: Duration.zero,
      ),
    );
    try {
      await remoteConfig.fetchAndActivate();
      await GetIt.I<LocalizationOverrides>().refreshOverrideLocalizations();
    } catch (error, trace) {
      logger.error('Unable to fetch remote config. Cached or default values will be used', error: error, stackTrace: trace);
    }
  }

  @override
  String? getOptionalValue(String key) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    if (remoteConfig.getAll().containsKey(key)) return remoteConfig.getValue(key).asString();
    return null;
  }
}
