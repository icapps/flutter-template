import 'dart:ui';

import 'package:flutter_template/util/extension/localized_message_extension.dart';
import 'package:flutter_template/util/extension/remote_config_extension.dart';
import 'package:flutter_template/util/locale/localization_overrides.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalizationOverrides)
class LocalizationOverridesImpl extends LocalizationOverrides {
  @override
  Future<Map<String, dynamic>> getOverriddenLocalizations(Locale locale) async {
    return remoteConfig.overriddenTranslations.map<String, String>((key, value) => MapEntry(key, value.fromLocale(locale) ?? value.en ?? ''));
  }

  @override
  Future<void> refreshOverrideLocalizations() async {
    GetIt.I<GlobalViewModel>().overrideLocalizations();
  }
}
