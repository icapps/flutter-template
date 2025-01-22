import 'package:flutter/material.dart';
import 'package:flutter_template/model/data/remote_config/localized_message.dart';
import 'package:flutter_template/util/locale/localization.dart';

extension LocalizedMessageExtension on LocalizedMessage {
  String? localized(BuildContext context) {
    final locale = Localization.of(context).locale;
    if (locale == null) return en;
    
    final languageCode = locale.languageCode;
    if (languageCode.contains('en')) return en;
    return en;
  }

  String? fromLocale(Locale locale) {
    final languageCode = locale.languageCode;
    if (languageCode.contains('en')) return en;
    return en;
  }
}
