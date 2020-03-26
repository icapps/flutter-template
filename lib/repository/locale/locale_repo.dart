import 'package:flutter/material.dart';

abstract class LocaleRepo {
  Future<void> setCustomLocale(Locale locale);

  Future<Locale> getCustomLocale();
}
