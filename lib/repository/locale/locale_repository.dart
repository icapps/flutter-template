import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LocaleRepository {
  @factoryMethod
  factory LocaleRepository(SharedPreferenceStorage preferences) = _LocaleRepository;

  Future<void> setCustomLocale(Locale? locale);

  Locale? getCustomLocale();
}

class _LocaleRepository implements LocaleRepository {
  static const _localeKey = 'locale';

  final SharedPreferenceStorage _sharedPreferences;

  _LocaleRepository(this._sharedPreferences);

  @override
  Future<void> setCustomLocale(Locale? locale) async {
    if (locale == null) {
      await _sharedPreferences.deleteKey(_localeKey);
    } else {
      await _sharedPreferences.saveString(key: _localeKey, value: locale.languageCode);
    }
  }

  @override
  Locale? getCustomLocale() {
    final localeCode = _sharedPreferences.getString(_localeKey);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
