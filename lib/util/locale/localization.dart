import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/locale/localization_overrides.dart';
import 'package:sprintf/sprintf.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//

typedef LocaleFilter = bool Function(String languageCode);

class Localization {
  LocaleFilter? localeFilter;

  var _localisedValues = <String, dynamic>{};
  var _localisedOverrideValues = <String, dynamic>{};

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization)!;

  /// The locale is used to get the correct json locale.
  /// It can later be used to check what the locale is that was used to load this Localization instance.
  final Locale? locale;

  Localization({required this.locale});

  static Future<Localization> load({
    required Locale locale, 
    LocalizationOverrides? localizationOverrides,
    bool showLocalizationKeys = false,
    bool useCaching = true,
    AssetBundle? bundle,
    }) async {
    final localizations = Localization(locale: locale);
    if (showLocalizationKeys) {
      return localizations;
    }
    if (localizationOverrides != null) {
      final overrideLocalizations = await localizationOverrides.getOverriddenLocalizations(locale);
      localizations._localisedOverrideValues = overrideLocalizations;
    }
    final jsonContent = await (bundle ?? rootBundle).loadString('assets/locale/${locale.toLanguageTag()}.json', cache: useCaching);
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>;
    return localizations;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value = (_localisedOverrideValues[key] ?? _localisedValues[key]) as String?;
      if (value == null) return key;
      if (args == null || args.isEmpty) return value;
      return sprintf(value, args);
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  /// Translations:
  ///
  /// nl:  **'Animaties'**
  ///
  /// en:  **'Animations'**
  String get debugAnimationsTitle => _t(LocalizationKeys.debugAnimationsTitle);

  /// Translations:
  ///
  /// nl:  **'Database'**
  ///
  /// en:  **'Database'**
  String get debugDatabase => _t(LocalizationKeys.debugDatabase);

  /// Translations:
  ///
  /// nl:  **'Bekijk de licenties'**
  ///
  /// en:  **'View licenses'**
  String get debugLicensesGoTo => _t(LocalizationKeys.debugLicensesGoTo);

  /// Translations:
  ///
  /// nl:  **'Licenties'**
  ///
  /// en:  **'Licenses'**
  String get debugLicensesTitle => _t(LocalizationKeys.debugLicensesTitle);

  /// Translations:
  ///
  /// nl:  **'Huidige taal: [arg1 string]'**
  ///
  /// en:  **'Current language: [arg1 string]'**
  String debugLocaleCurrentLanguage(String arg1) => _t(LocalizationKeys.debugLocaleCurrentLanguage, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Selecteer uw taal'**
  ///
  /// en:  **'Select your language'**
  String get debugLocaleSelector => _t(LocalizationKeys.debugLocaleSelector);

  /// Translations:
  ///
  /// nl:  **'Taal'**
  ///
  /// en:  **'Language'**
  String get debugLocaleTitle => _t(LocalizationKeys.debugLocaleTitle);

  /// Translations:
  ///
  /// nl:  **'Native brug'**
  ///
  /// en:  **'Native bridge'**
  String get debugNativeBridge => _t(LocalizationKeys.debugNativeBridge);

  /// Translations:
  ///
  /// nl:  **'Stuur native log'**
  ///
  /// en:  **'Send native log'**
  String get debugNativeBridgeLog => _t(LocalizationKeys.debugNativeBridgeLog);

  /// Translations:
  ///
  /// nl:  **'Toon vertalingen'**
  ///
  /// en:  **'Show translations'**
  String get debugShowTranslations => _t(LocalizationKeys.debugShowTranslations);

  /// Translations:
  ///
  /// nl:  **'Trage animaties'**
  ///
  /// en:  **'Slow animations'**
  String get debugSlowAnimations => _t(LocalizationKeys.debugSlowAnimations);

  /// Translations:
  ///
  /// nl:  **'Huidig platfrom: [arg1 string]'**
  ///
  /// en:  **'Current platfrom: [arg1 string]'**
  String debugTargetPlatformSubtitle(String arg1) => _t(LocalizationKeys.debugTargetPlatformSubtitle, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Doelplatform'**
  ///
  /// en:  **'Target platfrom'**
  String get debugTargetPlatformTitle => _t(LocalizationKeys.debugTargetPlatformTitle);

  /// Translations:
  ///
  /// nl:  **'Thema'**
  ///
  /// en:  **'Theme'**
  String get debugThemeTitle => _t(LocalizationKeys.debugThemeTitle);

  /// Translations:
  ///
  /// nl:  **'Debuggen'**
  ///
  /// en:  **'Debug'**
  String get debugTitle => _t(LocalizationKeys.debugTitle);

  /// Translations:
  ///
  /// nl:  **'Vertaling sluitels'**
  ///
  /// en:  **'Translation Keys'**
  String get debugTranslationsTitle => _t(LocalizationKeys.debugTranslationsTitle);

  /// Translations:
  ///
  /// nl:  **'Toon database'**
  ///
  /// en:  **'View database'**
  String get debugViewDatabase => _t(LocalizationKeys.debugViewDatabase);

  /// Translations:
  ///
  /// nl:  **'Foute request error'**
  ///
  /// en:  **'Bad request error'**
  String get errorBadRequest => _t(LocalizationKeys.errorBadRequest);

  /// Translations:
  ///
  /// nl:  **'Je hebt een programmeerfout gemaakt'**
  ///
  /// en:  **'You coded something wrong'**
  String get errorDuringDev => _t(LocalizationKeys.errorDuringDev);

  /// Translations:
  ///
  /// nl:  **'Geen toegang error'**
  ///
  /// en:  **'Forbidden error'**
  String get errorForbidden => _t(LocalizationKeys.errorForbidden);

  /// Translations:
  ///
  /// nl:  **'Er liep iets mis'**
  ///
  /// en:  **'Something went wrong'**
  String get errorGeneral => _t(LocalizationKeys.errorGeneral);

  /// Translations:
  ///
  /// nl:  **'Er liep iets mis (code: [arg1 string])'**
  ///
  /// en:  **'Something went wrong (code: [arg1 string])'**
  String errorGeneralWithCode(String arg1) => _t(LocalizationKeys.errorGeneralWithCode, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Intern server probleem'**
  ///
  /// en:  **'Internal server error'**
  String get errorInternalServer => _t(LocalizationKeys.errorInternalServer);

  /// Translations:
  ///
  /// nl:  **'Geen internet verbinding beschikbaar'**
  ///
  /// en:  **'No internet connection available'**
  String get errorNoNetwork => _t(LocalizationKeys.errorNoNetwork);

  /// Translations:
  ///
  /// nl:  **'Ongeautoriseerde fout'**
  ///
  /// en:  **'Unauthorized error'**
  String get errorUnauthorized => _t(LocalizationKeys.errorUnauthorized);

  /// Translations:
  ///
  /// nl:  **'Android'**
  ///
  /// en:  **'Android'**
  String get generalLabelAndroid => _t(LocalizationKeys.generalLabelAndroid);

  /// Translations:
  ///
  /// nl:  **'Annuleer'**
  ///
  /// en:  **'Cancel'**
  String get generalLabelCancel => _t(LocalizationKeys.generalLabelCancel);

  /// Translations:
  ///
  /// nl:  **'Verwijder'**
  ///
  /// en:  **'Delete'**
  String get generalLabelDelete => _t(LocalizationKeys.generalLabelDelete);

  /// Translations:
  ///
  /// nl:  **'iOS'**
  ///
  /// en:  **'iOS'**
  String get generalLabelIos => _t(LocalizationKeys.generalLabelIos);

  /// Translations:
  ///
  /// nl:  **'Nee'**
  ///
  /// en:  **'No'**
  String get generalLabelNo => _t(LocalizationKeys.generalLabelNo);

  /// Translations:
  ///
  /// nl:  **'Ok'**
  ///
  /// en:  **'Ok'**
  String get generalLabelOk => _t(LocalizationKeys.generalLabelOk);

  /// Translations:
  ///
  /// nl:  **'Opslaan'**
  ///
  /// en:  **'Save'**
  String get generalLabelSave => _t(LocalizationKeys.generalLabelSave);

  /// Translations:
  ///
  /// nl:  **'Systeem standaard'**
  ///
  /// en:  **'System default'**
  String get generalLabelSystemDefault => _t(LocalizationKeys.generalLabelSystemDefault);

  /// Translations:
  ///
  /// nl:  **'Ja'**
  ///
  /// en:  **'Yes'**
  String get generalLabelYes => _t(LocalizationKeys.generalLabelYes);

  /// Translations:
  ///
  /// nl:  **'Instellingen'**
  ///
  /// en:  **'Settings'**
  String get settingsTitle => _t(LocalizationKeys.settingsTitle);

  /// Translations:
  ///
  /// nl:  **'Vul hier uw todo in'**
  ///
  /// en:  **'Enter your todo'**
  String get todoAddInputHint => _t(LocalizationKeys.todoAddInputHint);

  /// Translations:
  ///
  /// nl:  **'Todo toevoegen'**
  ///
  /// en:  **'Add todo'**
  String get todoAddTitle => _t(LocalizationKeys.todoAddTitle);

  /// Translations:
  ///
  /// nl:  **'Er is nog geen data toegevoegd in uw database. Je kan een paar todo's ophalen van een api calll (download icoon) of je kan er zelf toevoegen door op het plus icoon te drukken.'**
  ///
  /// en:  **'No data added to your database. Fetch some todos with an api call (download icon) or add one yourself by clicking the add icon.'**
  String get todoEmptyState => _t(LocalizationKeys.todoEmptyState);

  /// Translations:
  ///
  /// nl:  **'Todo'**
  ///
  /// en:  **'Todo'**
  String get todoTitle => _t(LocalizationKeys.todoTitle);

  /// Translations:
  ///
  /// nl:  **'Thema'**
  ///
  /// en:  **'Theme'**
  String get debugThemeModeTitle => _t(LocalizationKeys.debugThemeModeTitle);

  /// Translations:
  ///
  /// nl:  **'Toon de app in dark mode of light'**
  ///
  /// en:  **'Show the app in dark mode or light'**
  String get debugThemeModeSubtitle => _t(LocalizationKeys.debugThemeModeSubtitle);

  /// Translations:
  ///
  /// nl:  **'Light'**
  ///
  /// en:  **'Light'**
  String get themeModeLabelLight => _t(LocalizationKeys.themeModeLabelLight);

  /// Translations:
  ///
  /// nl:  **'Dark'**
  ///
  /// en:  **'Dark'**
  String get themeModeLabelDark => _t(LocalizationKeys.themeModeLabelDark);

  /// Translations:
  ///
  /// nl:  **'Systeem standaard'**
  ///
  /// en:  **'System default'**
  String get themeModeLabelSystem => _t(LocalizationKeys.themeModeLabelSystem);

  /// Translations:
  ///
  /// nl:  **'Help ons verbeteren'**
  ///
  /// en:  **'Help us improve'**
  String get permissionAnalyticsTitle => _t(LocalizationKeys.permissionAnalyticsTitle);

  /// Translations:
  ///
  /// nl:  **'Wij willen graag weten hoe je de app gebruikt. Dit helpt ons je gebruikservaring beter te maken. We sturen hierbij geen persoonsgegevens door. '**
  ///
  /// en:  **'We would love to know how you use our app. This helps us to improve your user experience. No personal data is collected. '**
  String get permissionAnalyticsDescription => _t(LocalizationKeys.permissionAnalyticsDescription);

  /// Translations:
  ///
  /// nl:  **'Toestaan'**
  ///
  /// en:  **'Accept'**
  String get permissionButtonAccept => _t(LocalizationKeys.permissionButtonAccept);

  /// Translations:
  ///
  /// nl:  **'Weigeren'**
  ///
  /// en:  **'Decline'**
  String get permissionButtonDecline => _t(LocalizationKeys.permissionButtonDecline);

  /// Translations:
  ///
  /// nl:  **'Meer informatie'**
  ///
  /// en:  **'More info'**
  String get permissionButtonMoreInfo => _t(LocalizationKeys.permissionButtonMoreInfo);

  /// Translations:
  ///
  /// nl:  **'Permissies'**
  ///
  /// en:  **'Permissions'**
  String get debugPermissionsTitle => _t(LocalizationKeys.debugPermissionsTitle);

  /// Translations:
  ///
  /// nl:  **'Toon analytics permissie scherm '**
  ///
  /// en:  **'Show analytics permission screen'**
  String get debugPermissionsShowAnalyticsPermission => _t(LocalizationKeys.debugPermissionsShowAnalyticsPermission);

  /// Translations:
  ///
  /// nl:  **'Reset analytics permissie'**
  ///
  /// en:  **'Reset analytics permission'**
  String get debugPermissionResetAnalytics => _t(LocalizationKeys.debugPermissionResetAnalytics);

  /// Translations:
  ///
  /// nl:  **'Analytics permissie'**
  ///
  /// en:  **'Analytics permission'**
  String get semanticAnalyticsScreenImage => _t(LocalizationKeys.semanticAnalyticsScreenImage);

  /// Translations:
  ///
  /// nl:  **'Download todo's'**
  ///
  /// en:  **'Download todo's'**
  String get semanticTodoListScreenDownloadAction => _t(LocalizationKeys.semanticTodoListScreenDownloadAction);

  /// Translations:
  ///
  /// nl:  **'Add todo'**
  ///
  /// en:  **'Voeg todo toe'**
  String get semanticTodoListScreenAddAction => _t(LocalizationKeys.semanticTodoListScreenAddAction);

  /// Translations:
  ///
  /// nl:  **'Toggle $1%s'**
  ///
  /// en:  **'Toggle $1%s'**
  String semanticToggle(String arg1) => _t(LocalizationKeys.semanticToggle, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'On'**
  ///
  /// en:  **'Aan'**
  String get semanticToggleOn => _t(LocalizationKeys.semanticToggleOn);

  /// Translations:
  ///
  /// nl:  **'Uit'**
  ///
  /// en:  **'Off'**
  String get semanticToggleOff => _t(LocalizationKeys.semanticToggleOff);

  /// Translations:
  ///
  /// nl:  **'Bottom navigation item $1%s'**
  ///
  /// en:  **'Bottom navigation item $1%s'**
  String semanticBottomNavigationItem(String arg1) => _t(LocalizationKeys.semanticBottomNavigationItem, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Terug'**
  ///
  /// en:  **'Back'**
  String get semanticBack => _t(LocalizationKeys.semanticBack);

  String getTranslation(String key, {List<dynamic>? args}) => _t(key, args: args ?? <dynamic>[]);

}
