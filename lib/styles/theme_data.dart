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
    primaryColor: ThemeColors.main16,
    colorScheme: const ColorScheme(
      primary: ThemeColors.main16,
      primaryContainer: ThemeColors.main16,
      onPrimary: ThemeColors.neutral100,
      secondary: ThemeColors.accentThink40,
      secondaryContainer: ThemeColors.accentThink40,
      onSecondary: ThemeColors.neutral100,
      surface: ThemeColors.neutral96,
      onSurface: ThemeColors.main16,
      onError: ThemeColors.main16,
      error: ThemeColors.systemNegative52,
      brightness: Brightness.light,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accentThink40,
      selectionHandleColor: ThemeColors.accentThink40,
      selectionColor: ThemeColors.accentThink40.withOpacity(0.4),
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

enum FlutterTemplateThemeStyle {
  dark,
  light,
}

class FlutterTemplateTheme {
  // Brand base
  final Color main;
  final Color pureWhite;
  final Color pureBlack;

  // Brand Accent
  final Color accentThink;
  final Color accentBuild;
  final Color accentMaintain;
  final Color accentCelebrate;

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

  final bool isDarkTheme;

  bool get isLightTheme => !isDarkTheme;

  static final _instanceDark = FlutterTemplateTheme._(
    isDarkTheme: true,
    main: ThemeColors.main16,
    pureWhite: ThemeColors.neutral100,
    pureBlack: ThemeColors.neutral0,
    accentThink: ThemeColors.accentThink40,
    accentBuild: ThemeColors.accentBuild60,
    accentMaintain: ThemeColors.accentMaintain52,
    accentCelebrate: ThemeColors.accentCelebrate60,
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
    isDarkTheme: false,
    main: ThemeColors.main16,
    pureWhite: ThemeColors.neutral100,
    pureBlack: ThemeColors.neutral0,
    accentThink: ThemeColors.accentThink40,
    accentBuild: ThemeColors.accentBuild60,
    accentMaintain: ThemeColors.accentMaintain52,
    accentCelebrate: ThemeColors.accentCelebrate60,
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
    required this.main,
    required this.pureWhite,
    required this.pureBlack,
    required this.accentThink,
    required this.accentBuild,
    required this.accentMaintain,
    required this.accentCelebrate,
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
  // old textstyles, to be removed
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

  // Design system textstyles

  // Heading
  TextStyle get headingXl => TextStyle(fontSize: 32, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.w700, height: 1);

  TextStyle get headingL => TextStyle(fontSize: 28, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.w700, height: 1);

  TextStyle get headingM => TextStyle(fontSize: 26, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.w700, height: 1);

  TextStyle get headingS => TextStyle(fontSize: 24, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.w700, height: 1);

  TextStyle get headingXs => TextStyle(fontSize: 20, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.w700, height: 1);

  TextStyle get headingXXS => TextStyle(fontSize: 18, color: this, fontFamily: ThemeFonts.title, fontWeight: FontWeight.w700, height: 1);

  // Paragraph
  TextStyle get paragraphM => TextStyle(fontSize: 16, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1.5);

  TextStyle get paragraphS => TextStyle(fontSize: 13, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1.5);

  TextStyle get paragraphXs => TextStyle(fontSize: 11, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1.5);

  // Label

  TextStyle get labelM => TextStyle(fontSize: 16, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1);

  TextStyle get labelS => TextStyle(fontSize: 13, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1);

  TextStyle get labelXs => TextStyle(fontSize: 11, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1);

  // Data
  TextStyle get dataM => TextStyle(fontSize: 16, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1);

  TextStyle get dataS => TextStyle(fontSize: 13, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1);

  TextStyle get dataXs => TextStyle(fontSize: 11, color: this, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 1);
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
