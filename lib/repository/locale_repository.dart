import 'package:flutter/widgets.dart';
import 'package:flutter_template/repository/shared_prefs.dart';

class LocaleRepository {
  static const STORE_LOCALE = 'locale';

  final SharedPrefs _sharedPrefs;

  LocaleRepository(this._sharedPrefs);

  Future<void> setCustomLocale(Locale locale) async {
    if (locale == null) {
      await _sharedPrefs.deleteKey(STORE_LOCALE);
      return;
    }
    await _sharedPrefs.saveString(STORE_LOCALE, locale.languageCode);
  }

  //can be null
  Future<Locale> getCustomLocale() async {
    final localeCode = _sharedPrefs.getString(STORE_LOCALE);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
