import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//
class Localization {
  Map<dynamic, dynamic> _localisedValues;

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization);
  
  static Future<Localization> load(Locale locale) async {
    final localizations = Localization();
    print('Switching to ${locale.languageCode}');
    final jsonContent = await rootBundle.loadString('assets/locale/${locale.languageCode}.json');
    final Map<String, dynamic> values = json.decode(jsonContent);
    localizations._localisedValues = values;
    return localizations;
  }

  String _t(String key) {
    try {
      final value = _localisedValues[key];
      if (value == null) return '⚠$key⚠';
      return value;
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String get appTitle => _t('app_title');

  String get welcomeMessage => _t('welcome_message');

  String get userClickMessage => _t('user_click_message');

  String get usersNotFound => _t('users_not_found');

  String get retryBtn => _t('retry_btn');
}
