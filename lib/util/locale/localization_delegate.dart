import 'dart:async';

import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter/material.dart';

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

  Locale newLocale;
  Locale activeLocale;

  LocalizationDelegate({this.newLocale}) {
    if (newLocale != null) {
      activeLocale = newLocale;
    }
  }

  @override
  bool isSupported(Locale locale) => supportedLanguages.contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    activeLocale = newLocale ?? locale;
    return Localization.load(activeLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => true;

}
