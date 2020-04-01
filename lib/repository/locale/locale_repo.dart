import 'package:flutter/material.dart';

abstract class LocaleRepo {
  Future<void> setCustomLocale(Locale locale);

  Locale getCustomLocale();
}
