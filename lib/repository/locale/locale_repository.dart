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
  static const _STORE_LOCALE = 'locale';

  final SharedPreferenceStorage _sharedPrefs;

  _LocaleRepository(this._sharedPrefs);

  @override
  Future<void> setCustomLocale(Locale? locale) async {
    if (locale == null) {
      await _sharedPrefs.deleteKey(_STORE_LOCALE);
    } else {
      await _sharedPrefs.saveString(key: _STORE_LOCALE, value: locale.languageCode);
    }
  }

  @override
  Locale? getCustomLocale() {
    final localeCode = _sharedPrefs.getString(_STORE_LOCALE);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
