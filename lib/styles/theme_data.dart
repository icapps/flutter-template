import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
import 'package:flutter_template/util/theme/theme_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class FlutterTemplateThemeData {
  FlutterTemplateThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: ThemeFonts.body,
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryContainer: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryContainer: ThemeColors.accent,
      onSecondary: ThemeColors.white,
      surface: ThemeColors.backgroundGrey,
      onSurface: ThemeColors.primary,
      onError: ThemeColors.primaryDark,
      brightness: Brightness.light,
      error: ThemeColors.error,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accent,
      selectionHandleColor: ThemeColors.accent,
      selectionColor: ThemeColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: isInTest ? const FadeUpwardsPageTransitionsBuilder() : BaseThemeData.getCorrectPageTransitionBuilder(OsInfo.instance),
      },
    ),
  );

  static final _lightThemeData = _darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform? targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform? targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }
}

class FlutterTemplateTextTheme {
  final TextStyle titleHuge;
  final TextStyle titleBig;
  final TextStyle titleNormal;
  final TextStyle titleSmall;

  final TextStyle titleListItem;

  final TextStyle labelButtonBig;
  final TextStyle labelButtonSmall;

  final TextStyle bodyNormal;
  final TextStyle bodySmall;
  final TextStyle bodyUltraSmall;
  final TextStyle infoBodySubHeader;
  final TextStyle bodyBig;

  const FlutterTemplateTextTheme({
    required this.titleHuge,
    required this.titleBig,
    required this.titleNormal,
    required this.titleSmall,
    required this.titleListItem,
    required this.labelButtonBig,
    required this.labelButtonSmall,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
  });
}

enum FlutterTemplateThemeStyle {
  dark,
  light,
}

class FlutterTemplateTheme {
  final bool isDarkTheme;

  // old colors, to be removed
  final Color text;
  final Color lightText;
  final Color fadedText;
  final Color inverseText;
  final Color errorText;
  final Color buttonTextDisabled;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color permissionScreenBackground;
  final Color inverseBackground;
  final Color disabled;
  final Color icon;
  final Color appBarAction;
  final Color inverseIcon;
  final Color inverseProgressIndicator;
  final Color shadow;
  final Color progressIndicator;
  final Color buttonColor;
  final Color buttonText;
  final Color inverseButtonText;
  final Color textButtonText;
  final Color fillInformative;
  final Color cardBackground;
  final Color switchBackground;

  final Color bottomNavbarBackground;
  final Color bottomNavbarItemActive;
  final Color bottomNavbarItemInactive;

  final Color inputFieldFill;
  final Color inputFieldHint;
  final Color inputFieldBorderEnabled;
  final Color inputFieldBorderFocused;
  final Color inputFieldBorderIdle;
  final Color inputFieldCursor;

  final Color debugTitleBackground;

  // Design system colors

  // Brand base
  final Color main;
  final Color pureWhite;

  // Brand Accent
  final Color think;
  final Color build;
  final Color maintain;
  final Color celebrate;

  // Fill system
  final Color systemPositive;
  final Color systemAttention;
  final Color systemNegative;
  final Color systemInformative;

  // Fill neutral
  final Color canvas;
  final Color level1;
  final Color level2;
  final Color level3;
  final Color level4;

  // Stroke neutral
  final Color strokeDefault;
  final Color strokeSubtle;

  // Text heading brand
  final Color headingBrandDefault;
  final Color headingBrandThink;
  final Color headingBrandBuild;
  final Color headingBrandMaintain;
  final Color headingBrandCelebrate;

  // Text heading system
  final Color headingSystemPositive;
  final Color headingSystemPositiveDark;
  final Color headingSystemNegative;
  final Color headingSystemNegativeDark;
  final Color headingSystemAttention;
  final Color headingSystemAttentionDark;
  final Color headingSystemInformative;
  final Color headingSystemInformativeDark;

  // Text body brand
  final Color bodyBrandDefault;
  final Color bodyBrandSubtle;
  final Color bodyBrandFaded;

  // Text body system
  final Color bodySystemPositive;
  final Color bodySystemPositiveDark;
  final Color bodySystemNegative;
  final Color bodySystemNegativeDark;
  final Color bodySystemAttention;
  final Color bodySystemAttentionDark;
  final Color bodySystemInformative;
  final Color bodySystemInformativeDark;

  // Text body neutral
  final Color bodyNeutralDefault;
  final Color bodyNeutralSubtle;
  final Color bodyNeutralFaded;

  // Text action
  final Color actionDefault;

  bool get isLightTheme => !isDarkTheme;

  static final _instanceDark = FlutterTemplateTheme._(
    // old colors, to be removed
    isDarkTheme: true,
    text: ThemeColors.white,
    fadedText: ThemeColors.lightGrey,
    inverseText: ThemeColors.black,
    errorText: ThemeColors.error,
    primary: ThemeColors.primary,
    accent: ThemeColors.accent,
    secondary: ThemeColors.white,
    background: ThemeColors.primary,
    permissionScreenBackground: ThemeColors.primary,
    inverseBackground: ThemeColors.white,
    disabled: ThemeColors.disabledGrey,
    icon: ThemeColors.white,
    appBarAction: ThemeColors.white,
    inverseIcon: ThemeColors.black,
    progressIndicator: ThemeColors.primary,
    inverseProgressIndicator: ThemeColors.white,
    shadow: ThemeColors.shadow,
    buttonText: ThemeColors.primary,
    inverseButtonText: ThemeColors.white,
    buttonTextDisabled: ThemeColors.lightGrey,
    buttonColor: ThemeColors.accent,
    textButtonText: ThemeColors.white,
    bottomNavbarBackground: ThemeColors.darkBackground,
    bottomNavbarItemActive: ThemeColors.white,
    bottomNavbarItemInactive: ThemeColors.white50,
    inputFieldFill: ThemeColors.black,
    inputFieldHint: ThemeColors.white50,
    inputFieldBorderEnabled: ThemeColors.white50,
    inputFieldBorderFocused: ThemeColors.white,
    inputFieldBorderIdle: ThemeColors.white50,
    inputFieldCursor: ThemeColors.accent,
    debugTitleBackground: ThemeColors.white20,
    fillInformative: ThemeColors.darkAccent,
    cardBackground: ThemeColors.darkBackground,
    lightText: ThemeColors.white,
    switchBackground: ThemeColors.fadedGrey,

    // Design system colors
    main: ThemeColors.main16,
    pureWhite: ThemeColors.neutral100,
    think: ThemeColors.accentThink40,
    build: ThemeColors.accentBuild60,
    maintain: ThemeColors.accentMaintain52,
    celebrate: ThemeColors.accentCelebrate60,
    systemPositive: ThemeColors.systemPositive96,
    systemAttention: ThemeColors.systemAttention96,
    systemNegative: ThemeColors.systemNegative96,
    systemInformative: ThemeColors.systemInfo96,
    canvas: ThemeColors.neutral100,
    level1: ThemeColors.neutral96,
    level2: ThemeColors.neutral92,
    level3: ThemeColors.neutral88,
    level4: ThemeColors.neutral84,
    strokeDefault: ThemeColors.neutral76,
    strokeSubtle: ThemeColors.neutral88,
    headingBrandDefault: ThemeColors.main16,
    headingBrandThink: ThemeColors.accentThink32,
    headingBrandBuild: ThemeColors.accentBuild32,
    headingBrandMaintain: ThemeColors.accentMaintain52,
    headingBrandCelebrate: ThemeColors.accentCelebrate36,
    headingSystemPositive: ThemeColors.systemPositive28,
    headingSystemPositiveDark: ThemeColors.systemPositive16,
    headingSystemNegative: ThemeColors.systemNegative52,
    headingSystemNegativeDark: ThemeColors.systemNegative24,
    headingSystemAttention: ThemeColors.systemAttention36,
    headingSystemAttentionDark: ThemeColors.systemAttention24,
    headingSystemInformative: ThemeColors.systemInfo36,
    headingSystemInformativeDark: ThemeColors.systemInfo24,
    bodyBrandDefault: ThemeColors.main16,
    bodyBrandSubtle: ThemeColors.main32,
    bodyBrandFaded: ThemeColors.main44,
    bodySystemPositive: ThemeColors.systemPositive28,
    bodySystemPositiveDark: ThemeColors.systemPositive16,
    bodySystemNegative: ThemeColors.systemNegative52,
    bodySystemNegativeDark: ThemeColors.systemNegative24,
    bodySystemAttention: ThemeColors.systemAttention36,
    bodySystemAttentionDark: ThemeColors.systemAttention24,
    bodySystemInformative: ThemeColors.systemInfo36,
    bodySystemInformativeDark: ThemeColors.systemInfo24,
    bodyNeutralDefault: ThemeColors.neutral20,
    bodyNeutralSubtle: ThemeColors.neutral36,
    bodyNeutralFaded: ThemeColors.neutral48,
    actionDefault: ThemeColors.accentThink32,
  );

  static final _instanceLight = FlutterTemplateTheme._(
    // old colors, to be removed
    isDarkTheme: false,
    text: ThemeColors.primary,
    fadedText: ThemeColors.fadedGrey,
    inverseText: ThemeColors.white,
    errorText: ThemeColors.error,
    primary: ThemeColors.primary,
    accent: ThemeColors.accent,
    secondary: ThemeColors.black,
    background: ThemeColors.backgroundGrey,
    permissionScreenBackground: ThemeColors.white,
    inverseBackground: ThemeColors.white,
    inputFieldFill: ThemeColors.white,
    inputFieldHint: ThemeColors.mediumGrey,
    disabled: ThemeColors.disabledGrey,
    icon: ThemeColors.primary,
    appBarAction: ThemeColors.primary,
    inverseIcon: ThemeColors.black,
    progressIndicator: ThemeColors.primary,
    inverseProgressIndicator: ThemeColors.white,
    shadow: ThemeColors.shadow,
    buttonText: ThemeColors.white,
    inverseButtonText: ThemeColors.primary,
    buttonTextDisabled: ThemeColors.lightGrey,
    buttonColor: ThemeColors.primary,
    textButtonText: ThemeColors.primary,
    bottomNavbarBackground: ThemeColors.white,
    bottomNavbarItemActive: ThemeColors.primary,
    bottomNavbarItemInactive: ThemeColors.mediumGrey,
    inputFieldBorderEnabled: ThemeColors.mediumGrey,
    inputFieldBorderFocused: ThemeColors.primary,
    inputFieldBorderIdle: ThemeColors.mediumGrey,
    inputFieldCursor: ThemeColors.accent,
    debugTitleBackground: ThemeColors.lightGrey,
    fillInformative: ThemeColors.lightAccent,
    cardBackground: ThemeColors.white,
    lightText: ThemeColors.white,
    switchBackground: ThemeColors.disabledGrey,

    // Design system colors
    main: ThemeColors.main16,
    pureWhite: ThemeColors.neutral100,
    think: ThemeColors.accentThink40,
    build: ThemeColors.accentBuild60,
    maintain: ThemeColors.accentMaintain52,
    celebrate: ThemeColors.accentCelebrate60,
    systemPositive: ThemeColors.systemPositive96,
    systemAttention: ThemeColors.systemAttention96,
    systemNegative: ThemeColors.systemNegative96,
    systemInformative: ThemeColors.systemInfo96,
    canvas: ThemeColors.neutral100,
    level1: ThemeColors.neutral96,
    level2: ThemeColors.neutral92,
    level3: ThemeColors.neutral88,
    level4: ThemeColors.neutral84,
    strokeDefault: ThemeColors.neutral76,
    strokeSubtle: ThemeColors.neutral88,
    headingBrandDefault: ThemeColors.main16,
    headingBrandThink: ThemeColors.accentThink32,
    headingBrandBuild: ThemeColors.accentBuild32,
    headingBrandMaintain: ThemeColors.accentMaintain52,
    headingBrandCelebrate: ThemeColors.accentCelebrate36,
    headingSystemPositive: ThemeColors.systemPositive28,
    headingSystemPositiveDark: ThemeColors.systemPositive16,
    headingSystemNegative: ThemeColors.systemNegative52,
    headingSystemNegativeDark: ThemeColors.systemNegative24,
    headingSystemAttention: ThemeColors.systemAttention36,
    headingSystemAttentionDark: ThemeColors.systemAttention24,
    headingSystemInformative: ThemeColors.systemInfo36,
    headingSystemInformativeDark: ThemeColors.systemInfo24,
    bodyBrandDefault: ThemeColors.main16,
    bodyBrandSubtle: ThemeColors.main32,
    bodyBrandFaded: ThemeColors.main44,
    bodySystemPositive: ThemeColors.systemPositive28,
    bodySystemPositiveDark: ThemeColors.systemPositive16,
    bodySystemNegative: ThemeColors.systemNegative52,
    bodySystemNegativeDark: ThemeColors.systemNegative24,
    bodySystemAttention: ThemeColors.systemAttention36,
    bodySystemAttentionDark: ThemeColors.systemAttention24,
    bodySystemInformative: ThemeColors.systemInfo36,
    bodySystemInformativeDark: ThemeColors.systemInfo24,
    bodyNeutralDefault: ThemeColors.neutral20,
    bodyNeutralSubtle: ThemeColors.neutral36,
    bodyNeutralFaded: ThemeColors.neutral48,
    actionDefault: ThemeColors.accentThink32,
  );

  FlutterTemplateTheme._({
    required this.isDarkTheme,
    required this.text,
    required this.fadedText,
    required this.inverseText,
    required this.errorText,
    required this.buttonTextDisabled,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.permissionScreenBackground,
    required this.inverseBackground,
    required this.disabled,
    required this.icon,
    required this.appBarAction,
    required this.inverseIcon,
    required this.inverseProgressIndicator,
    required this.shadow,
    required this.progressIndicator,
    required this.buttonColor,
    required this.buttonText,
    required this.inverseButtonText,
    required this.textButtonText,
    required this.bottomNavbarBackground,
    required this.bottomNavbarItemActive,
    required this.bottomNavbarItemInactive,
    required this.inputFieldFill,
    required this.inputFieldHint,
    required this.inputFieldBorderEnabled,
    required this.inputFieldBorderFocused,
    required this.inputFieldBorderIdle,
    required this.inputFieldCursor,
    required this.debugTitleBackground,
    required this.fillInformative,
    required this.cardBackground,
    required this.lightText,
    required this.switchBackground,
    required this.main,
    required this.pureWhite,
    required this.think,
    required this.build,
    required this.maintain,
    required this.celebrate,
    required this.systemPositive,
    required this.systemAttention,
    required this.systemNegative,
    required this.systemInformative,
    required this.canvas,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.strokeDefault,
    required this.strokeSubtle,
    required this.headingBrandDefault,
    required this.headingBrandThink,
    required this.headingBrandBuild,
    required this.headingBrandMaintain,
    required this.headingBrandCelebrate,
    required this.headingSystemPositive,
    required this.headingSystemPositiveDark,
    required this.headingSystemNegative,
    required this.headingSystemNegativeDark,
    required this.headingSystemAttention,
    required this.headingSystemAttentionDark,
    required this.headingSystemInformative,
    required this.headingSystemInformativeDark,
    required this.bodyBrandDefault,
    required this.bodyBrandSubtle,
    required this.bodyBrandFaded,
    required this.bodySystemPositive,
    required this.bodySystemPositiveDark,
    required this.bodySystemNegative,
    required this.bodySystemNegativeDark,
    required this.bodySystemAttention,
    required this.bodySystemAttentionDark,
    required this.bodySystemInformative,
    required this.bodySystemInformativeDark,
    required this.bodyNeutralDefault,
    required this.bodyNeutralSubtle,
    required this.bodyNeutralFaded,
    required this.actionDefault,
  });

  static FlutterTemplateTheme of(BuildContext context, {bool forceDark = false, bool forceLight = false}) {
    if (forceDark) return _instanceDark;
    if (forceLight) return _instanceLight;
    final themeConfigUtil = getIt<ThemeConfigUtil>();

    final theme = themeConfigUtil.themeMode;
    if (theme == ThemeMode.dark) {
      return _instanceDark;
    } else if (theme == ThemeMode.light) {
      return _instanceLight;
    }
    final brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) return _instanceDark;

    return _instanceLight;
  }
}

extension TextThemeExtension on Color {
  TextStyle get titleHuge => TextStyle(fontSize: 40, color: this, fontFamily: ThemeFonts.title, height: 1.2);

  TextStyle get titleBig => TextStyle(fontSize: 30, color: this, fontFamily: ThemeFonts.title, height: 1.2);

  TextStyle get titleNormal => TextStyle(fontSize: 24, color: this, fontFamily: ThemeFonts.title);

  TextStyle get titleSmall => TextStyle(fontSize: 18, color: this, fontFamily: ThemeFonts.title);

  TextStyle get titleListItem => TextStyle(fontSize: 18, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold);

  TextStyle get labelButtonBig => TextStyle(fontSize: 16, color: this, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold);

  TextStyle get labelButtonSmall => TextStyle(fontSize: 14, color: this, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold);

  TextStyle get bodyBig => TextStyle(fontSize: 18, color: this, fontFamily: ThemeFonts.body);

  TextStyle get bodyNormal => TextStyle(fontSize: 16, color: this, fontFamily: ThemeFonts.body);

  TextStyle get bodySmall => TextStyle(fontSize: 14, color: this, fontFamily: ThemeFonts.body);

  TextStyle get bodyUltraSmall => TextStyle(fontSize: 12, color: this, fontFamily: ThemeFonts.body);

  TextStyle get infoBodySubHeader => TextStyle(fontSize: 14, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600);
}

extension TextStyleExtension on TextStyle {
  // Font weights
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle get black => copyWith(fontWeight: FontWeight.w900);

  // Font styles
  TextStyle get underLine => copyWith(decoration: TextDecoration.underline);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension ShadowsExtension on Color {
  List<BoxShadow> get bottomNavShadow => [
        BoxShadow(
          offset: const Offset(0, -29),
          spreadRadius: 0,
          blurRadius: 29,
          color: withOpacity(0.02),
        ),
        BoxShadow(
          offset: const Offset(0, -65),
          spreadRadius: 0,
          blurRadius: 39,
          color: withOpacity(0.01),
        ),
        BoxShadow(
          offset: const Offset(0, -115),
          spreadRadius: 0,
          blurRadius: 46,
          color: withOpacity(0.01),
        ),
      ];
}
