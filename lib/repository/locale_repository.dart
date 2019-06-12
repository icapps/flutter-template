import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  static const STORE_LOCALE = 'locale';

  LocaleRepository();

  Future<void> setCustomLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      print('Reset custom locale. Use system language');
      await prefs.remove(STORE_LOCALE);
      return;
    }
    await prefs.setString(STORE_LOCALE, locale.languageCode);
  }

  //can be null
  Future<Locale> getCustomLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(STORE_LOCALE);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
