import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
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
      onBackground: ThemeColors.primary,
      onSurface: ThemeColors.primary,
      background: ThemeColors.backgroundGrey,
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
  final TextStyle labelButtonBigDisabled;
  final TextStyle labelButtonSmall;
  final TextStyle labelButtonSmallDisabled;

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
    required this.labelButtonBigDisabled,
    required this.labelButtonSmall,
    required this.labelButtonSmallDisabled,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
  });
}

class FlutterTemplateTextThemeExceptions {
  const FlutterTemplateTextThemeExceptions();
}

class FlutterTemplateColorsTheme {
  final Color text;
  final Color inverseText;
  final Color disabledButtonText;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color inverseBackground;
  final Color inputFieldFill;
  final Color disabled;
  final Color icon;
  final Color inverseIcon;
  final Color inverseProgressIndicator;
  final Color progressIndicator;

  const FlutterTemplateColorsTheme({
    required this.text,
    required this.inverseText,
    required this.disabledButtonText,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.inverseBackground,
    required this.inputFieldFill,
    required this.disabled,
    required this.icon,
    required this.inverseIcon,
    required this.inverseProgressIndicator,
    required this.progressIndicator,
  });
}

enum FlutterTemplateThemeStyle {
  dark,
  light,
}

class FlutterTemplateTheme {
  late FlutterTemplateTextTheme _coreTextTheme;
  late FlutterTemplateTextTheme _inverseCoreTextTheme;
  late FlutterTemplateTextTheme _accentTextTheme;
  late FlutterTemplateTextThemeExceptions _exceptionsTextTheme;
  late FlutterTemplateColorsTheme _colorsTheme;
  FlutterTemplateThemeStyle flutterTemplateThemeStyle = FlutterTemplateThemeStyle.light;

  static const _colorThemeDark = FlutterTemplateColorsTheme(
    text: ThemeColors.white,
    inverseText: ThemeColors.black,
    disabledButtonText: ThemeColors.lightGrey,
    primary: ThemeColors.darkMode_primary,
    accent: ThemeColors.accent,
    secondary: ThemeColors.white,
    background: ThemeColors.darkMode_primary,
    inverseBackground: ThemeColors.white,
    inputFieldFill: ThemeColors.white,
    disabled: ThemeColors.disabledGrey,
    icon: ThemeColors.white,
    inverseIcon: ThemeColors.black,
    progressIndicator: ThemeColors.darkMode_primary,
    inverseProgressIndicator: ThemeColors.white,
  );

  static const _colorThemeLight = FlutterTemplateColorsTheme(
    text: ThemeColors.black,
    inverseText: ThemeColors.white,
    disabledButtonText: ThemeColors.lightGrey,
    primary: ThemeColors.primary,
    accent: ThemeColors.accent,
    secondary: ThemeColors.black,
    background: ThemeColors.white,
    inverseBackground: ThemeColors.white,
    inputFieldFill: ThemeColors.white,
    disabled: ThemeColors.disabledGrey,
    icon: ThemeColors.white,
    inverseIcon: ThemeColors.black,
    progressIndicator: ThemeColors.primary,
    inverseProgressIndicator: ThemeColors.white,
  );

  static FlutterTemplateTextTheme _coreTextThemeFromColorsTheme({required FlutterTemplateColorsTheme colorTheme}) => FlutterTemplateTextTheme(
        titleHuge: TextStyle(fontSize: 40, color: colorTheme.text, fontFamily: ThemeFonts.title, height: 1.2),
        titleBig: TextStyle(fontSize: 30, color: colorTheme.text, fontFamily: ThemeFonts.title, height: 1.2),
        titleNormal: TextStyle(fontSize: 24, color: colorTheme.text, fontFamily: ThemeFonts.title),
        titleSmall: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: ThemeFonts.title),
        titleListItem: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
        labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.text, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabledButtonText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabledButtonText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        bodyBig: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: ThemeFonts.body),
        bodyNormal: TextStyle(fontSize: 16, color: colorTheme.text, fontFamily: ThemeFonts.body),
        bodySmall: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: ThemeFonts.body),
        bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.text, fontFamily: ThemeFonts.body),
        infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
      );

  static FlutterTemplateTextTheme _inverseCoreTextThemeFromColorsTheme({required FlutterTemplateColorsTheme colorTheme}) => FlutterTemplateTextTheme(
        titleHuge: TextStyle(fontSize: 40, color: colorTheme.inverseText, fontFamily: ThemeFonts.title, height: 1.2),
        titleBig: TextStyle(fontSize: 30, color: colorTheme.inverseText, fontFamily: ThemeFonts.title, height: 1.2),
        titleNormal: TextStyle(fontSize: 24, color: colorTheme.inverseText, fontFamily: ThemeFonts.title),
        titleSmall: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: ThemeFonts.title),
        titleListItem: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
        labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.inverseText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabledButtonText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabledButtonText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        bodyBig: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
        bodyNormal: TextStyle(fontSize: 16, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
        bodySmall: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
        bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
        infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
      );

  static FlutterTemplateTextTheme _accentTextThemeFromColorsTheme({required FlutterTemplateColorsTheme colorTheme}) => FlutterTemplateTextTheme(
        titleHuge: TextStyle(fontSize: 40, color: colorTheme.accent, fontFamily: ThemeFonts.title, height: 1.2),
        titleBig: TextStyle(fontSize: 30, color: colorTheme.accent, fontFamily: ThemeFonts.title, height: 1.2),
        titleNormal: TextStyle(fontSize: 24, color: colorTheme.accent, fontFamily: ThemeFonts.title),
        titleSmall: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: ThemeFonts.title),
        titleListItem: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
        labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.accent, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabledButtonText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabledButtonText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        bodyBig: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: ThemeFonts.body),
        bodyNormal: TextStyle(fontSize: 16, color: colorTheme.accent, fontFamily: ThemeFonts.body),
        bodySmall: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: ThemeFonts.body),
        bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.accent, fontFamily: ThemeFonts.body),
        infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
      );

  static FlutterTemplateTextThemeExceptions _textThemeExceptionsFromColorsTheme({required FlutterTemplateColorsTheme colorTheme}) => const FlutterTemplateTextThemeExceptions();

  FlutterTemplateTextTheme get coreTextTheme => _coreTextTheme;

  FlutterTemplateTextTheme get inverseCoreTextTheme => _inverseCoreTextTheme;

  FlutterTemplateTextTheme get accentTextTheme => _accentTextTheme;

  FlutterTemplateTextThemeExceptions get exceptionsTextTheme => _exceptionsTextTheme;

  FlutterTemplateColorsTheme get colorsTheme => _colorsTheme;

  FlutterTemplateTheme({FlutterTemplateColorsTheme colorsTheme = _colorThemeLight}) {
    _colorsTheme = colorsTheme;
    _coreTextTheme = _coreTextThemeFromColorsTheme(colorTheme: _colorsTheme);
    _inverseCoreTextTheme = _inverseCoreTextThemeFromColorsTheme(colorTheme: _colorsTheme);
    _accentTextTheme = _accentTextThemeFromColorsTheme(colorTheme: _colorsTheme);
    _exceptionsTextTheme = _textThemeExceptionsFromColorsTheme(colorTheme: _colorsTheme);
  }

  void configureForThemeStyle(FlutterTemplateThemeStyle themeStyle) {
    flutterTemplateThemeStyle = themeStyle;
    if (flutterTemplateThemeStyle == FlutterTemplateThemeStyle.dark) {
      _colorsTheme = _colorThemeDark;
    } else {
      _colorsTheme = _colorThemeLight;
    }

    _coreTextTheme = _coreTextThemeFromColorsTheme(colorTheme: _colorsTheme);
    _inverseCoreTextTheme = _inverseCoreTextThemeFromColorsTheme(colorTheme: _colorsTheme);
    _accentTextTheme = _accentTextThemeFromColorsTheme(colorTheme: _colorsTheme);
    _exceptionsTextTheme = _textThemeExceptionsFromColorsTheme(colorTheme: _colorsTheme);
  }
}
