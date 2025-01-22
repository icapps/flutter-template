
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/repository/remote_config/remote_config.dart';

extension RemoteConfigExtension on Object {
  RemoteConfig get remoteConfig => getIt.get<RemoteConfig>();
}
