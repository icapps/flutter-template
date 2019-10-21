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

  Locale newLocale;
  Locale activeLocale;
  bool isInTest;

  LocalizationDelegate({this.newLocale, this.isInTest = false}) {
    if (newLocale != null) {
      activeLocale = newLocale;
    }
    isInTest ??= false;
  }

  @override
  bool isSupported(Locale locale) => supportedLanguages.contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    activeLocale = newLocale ?? locale;
    return Localization.load(activeLocale, isInTest: isInTest);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => true;

}
