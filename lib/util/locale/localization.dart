import 'dart:ui';

import 'package:flutte_template/util/locale/translations/nl.dart';
import 'package:flutter/widgets.dart';

/*
 * AUTO-GENERATED FILE - DO NOT EDIT
 */
class Localization {
  static const List<Locale> supportedLanguages = [
    Locale('en'),
  ];
  static const _defaultLanguage = 'nl';

  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization);

  // ignore: prefer_constructors_over_static_methods
  static Localization ofLanguage(String language) => Localization(Locale(language));

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': nl,
    'fr': nl,
    'nl': nl,
  };

  String _t(String key) {
    Map<String, String> _values;
    if (_localizedValues.containsKey(locale.languageCode)) {
      _values = _localizedValues[locale.languageCode];
    } else {
      _values = _localizedValues[_defaultLanguage];
    }
    final value = _values[key];
    if (value == null) return '⚠$key⚠';
    return value;
  }

  String get appTitle => _t('app_title');

  String get welcomeMessage => _t('welcome_message');

  String get userClickMessage => _t('user_click_message');

  String get notFound => _t('users_not_found');

  String get retryBtn => _t('retry_btn');
}
