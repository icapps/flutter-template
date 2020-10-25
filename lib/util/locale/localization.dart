import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//
class Localization {
  Map<String, dynamic> _localisedValues = Map();

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization);

  static Future<Localization> load(Locale locale, {bool showLocalizationKeys = false}) async {
    final localizations = Localization();
    if (showLocalizationKeys) {
      return localizations;
    }
    final jsonContent = await rootBundle.loadString('assets/locale/${locale.languageCode}.json');
    // ignore: avoid_as
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>;
    return localizations;
  }

  String _t(String key, {List<dynamic> args}) {
    try {
      // ignore: avoid_as
      var value = _localisedValues[key] as String;
      if (value == null) return '$key';
      if (args == null || args.isEmpty) return value;
      args.asMap().forEach((index, arg) => value = _replaceWith(value, arg, index + 1));
      return value;
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String _replaceWith(String value, arg, argIndex) {
    if (arg == null) return value;
    if (arg is String) {
      return value.replaceAll('%$argIndex\$s', arg);
    } else if (arg is num) {
      return value.replaceAll('%$argIndex\$d', '$arg');
    }
    return value;
  }

  String get climbTitle => _t(LocalizationKeys.climbTitle);

  String get debugAnimationsTitle => _t(LocalizationKeys.debugAnimationsTitle);

  String get debugLicensesGoTo => _t(LocalizationKeys.debugLicensesGoTo);

  String get debugLicensesTitle => _t(LocalizationKeys.debugLicensesTitle);

  String debugLocaleCurrentLanguage(String arg1) => _t(LocalizationKeys.debugLocaleCurrentLanguage, args: [arg1]);

  String get debugLocaleSelector => _t(LocalizationKeys.debugLocaleSelector);

  String get debugLocaleTitle => _t(LocalizationKeys.debugLocaleTitle);

  String get debugNativeBridge => _t(LocalizationKeys.debugNativeBridge);

  String get debugNativeBridgeLog => _t(LocalizationKeys.debugNativeBridgeLog);

  String get debugShowTranslations => _t(LocalizationKeys.debugShowTranslations);

  String get debugSlowAnimations => _t(LocalizationKeys.debugSlowAnimations);

  String debugTargetPlatformSubtitle(String arg1) => _t(LocalizationKeys.debugTargetPlatformSubtitle, args: [arg1]);

  String get debugTargetPlatformTitle => _t(LocalizationKeys.debugTargetPlatformTitle);

  String get debugThemeTitle => _t(LocalizationKeys.debugThemeTitle);

  String get debugTitle => _t(LocalizationKeys.debugTitle);

  String get debugTranslationsTitle => _t(LocalizationKeys.debugTranslationsTitle);

  String get errorBadRequest => _t(LocalizationKeys.errorBadRequest);

  String get errorDuringDev => _t(LocalizationKeys.errorDuringDev);

  String get errorForbidden => _t(LocalizationKeys.errorForbidden);

  String get errorGeneral => _t(LocalizationKeys.errorGeneral);

  String errorGeneralWithCode(String arg1) => _t(LocalizationKeys.errorGeneralWithCode, args: [arg1]);

  String get errorInternalServer => _t(LocalizationKeys.errorInternalServer);

  String get errorNoNetwork => _t(LocalizationKeys.errorNoNetwork);

  String get errorUnauthorized => _t(LocalizationKeys.errorUnauthorized);

  String get generalLabelAndroid => _t(LocalizationKeys.generalLabelAndroid);

  String get generalLabelCancel => _t(LocalizationKeys.generalLabelCancel);

  String get generalLabelDelete => _t(LocalizationKeys.generalLabelDelete);

  String get generalLabelIos => _t(LocalizationKeys.generalLabelIos);

  String get generalLabelNo => _t(LocalizationKeys.generalLabelNo);

  String get generalLabelOk => _t(LocalizationKeys.generalLabelOk);

  String get generalLabelSave => _t(LocalizationKeys.generalLabelSave);

  String get generalLabelSystemDefault => _t(LocalizationKeys.generalLabelSystemDefault);

  String get generalLabelYes => _t(LocalizationKeys.generalLabelYes);

  String get settingsTitle => _t(LocalizationKeys.settingsTitle);

  String get todoAddInputHint => _t(LocalizationKeys.todoAddInputHint);

  String get todoAddTitle => _t(LocalizationKeys.todoAddTitle);

  String get todoEmptyState => _t(LocalizationKeys.todoEmptyState);

  String get todoTitle => _t(LocalizationKeys.todoTitle);

  String getTranslation(String key, {List<dynamic> args}) => _t(key, args: args ?? List());

}
