import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/util/locale/localization.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//
class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  static const defaultLocale = Locale('nl');
  static const supportedLanguages = [
    'nl',
    'en',
  ];

  static const supportedLocales = [
    Locale('nl'),
    Locale('en'),
  ];

  Locale? newLocale;
  Locale? activeLocale;
  bool showLocalizationKeys;

  LocalizationDelegate({this.newLocale, this.showLocalizationKeys = false}) {
    if (newLocale != null) {
      activeLocale = newLocale;
    }
  }

  @override
  bool isSupported(Locale locale) => supportedLanguages.contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    final newActiveLocale = newLocale ?? locale;
    activeLocale = newActiveLocale;
    return Localization.load(newActiveLocale, showLocalizationKeys: showLocalizationKeys);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) {
    if (old is LocalizationDelegate){
      return old.activeLocale != activeLocale || old.showLocalizationKeys != showLocalizationKeys;
    }
    return true;
  }

}
