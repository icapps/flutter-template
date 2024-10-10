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

class FlutterTemplateTextThemeExceptions {
  const FlutterTemplateTextThemeExceptions();
}

class FlutterTemplateColorsTheme {
  final Color text;
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

  const FlutterTemplateColorsTheme({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.permissionScreenBackground,
    required this.inverseBackground,
    required this.text,
    required this.inverseText,
    required this.errorText,
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
    required this.buttonTextDisabled,
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
  });
}

enum FlutterTemplateThemeStyle {
  dark,
  light,
}

class FlutterTemplateTheme {
  final FlutterTemplateTextTheme coreTextTheme;
  final FlutterTemplateTextTheme inverseCoreTextTheme;
  final FlutterTemplateTextTheme accentTextTheme;
  final FlutterTemplateTextTheme disabledTextTheme;
  final FlutterTemplateTextThemeExceptions exceptionsTextTheme;
  final FlutterTemplateColorsTheme colorsTheme;
  final bool isDarkTheme;

  bool get isLightTheme => !isDarkTheme;

  static final _instanceDark = _fromColorTheme(
    isDarkTheme: true,
    colorTheme: const FlutterTemplateColorsTheme(
      text: ThemeColors.white,
      inverseText: ThemeColors.black,
      errorText: ThemeColors.error,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.white,
      background: ThemeColors.black,
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
      buttonColor: ThemeColors.white,
      textButtonText: ThemeColors.white,
      bottomNavbarBackground: ThemeColors.primary,
      bottomNavbarItemActive: ThemeColors.white,
      bottomNavbarItemInactive: ThemeColors.white50,
      inputFieldFill: ThemeColors.black,
      inputFieldHint: ThemeColors.white50,
      inputFieldBorderEnabled: ThemeColors.white50,
      inputFieldBorderFocused: ThemeColors.white,
      inputFieldBorderIdle: ThemeColors.white50,
      inputFieldCursor: ThemeColors.accent,
      debugTitleBackground: ThemeColors.white20,
    ),
  );

  static final _instanceLight = _fromColorTheme(
    isDarkTheme: false,
    colorTheme: const FlutterTemplateColorsTheme(
      text: ThemeColors.black,
      inverseText: ThemeColors.white,
      errorText: ThemeColors.error,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.black,
      background: ThemeColors.white,
      permissionScreenBackground: ThemeColors.white,
      inverseBackground: ThemeColors.white,
      inputFieldFill: ThemeColors.white,
      inputFieldHint: ThemeColors.mediumGrey,
      disabled: ThemeColors.disabledGrey,
      icon: ThemeColors.primary,
      appBarAction: ThemeColors.white,
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
    ),
  );

  static FlutterTemplateTheme _fromColorTheme({
    required FlutterTemplateColorsTheme colorTheme,
    required bool isDarkTheme,
  }) =>
      FlutterTemplateTheme._(
        isDarkTheme: isDarkTheme,
        colorsTheme: colorTheme,
        disabledTextTheme: _getTextThemeFromColor(colorTheme.disabled),
        coreTextTheme: _getTextThemeFromColor(colorTheme.text),
        inverseCoreTextTheme: _getTextThemeFromColor(colorTheme.inverseText),
        accentTextTheme: _getTextThemeFromColor(colorTheme.accent),
        exceptionsTextTheme: const FlutterTemplateTextThemeExceptions(),
      );

  static FlutterTemplateTextTheme _getTextThemeFromColor(Color color) => FlutterTemplateTextTheme(
        titleHuge: TextStyle(fontSize: 40, color: color, fontFamily: ThemeFonts.title, height: 1.2),
        titleBig: TextStyle(fontSize: 30, color: color, fontFamily: ThemeFonts.title, height: 1.2),
        titleNormal: TextStyle(fontSize: 24, color: color, fontFamily: ThemeFonts.title),
        titleSmall: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.title),
        titleListItem: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
        labelButtonBig: TextStyle(fontSize: 16, color: color, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmall: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        bodyBig: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.body),
        bodyNormal: TextStyle(fontSize: 16, color: color, fontFamily: ThemeFonts.body),
        bodySmall: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.body),
        bodyUltraSmall: TextStyle(fontSize: 12, color: color, fontFamily: ThemeFonts.body),
        infoBodySubHeader: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
      );

  const FlutterTemplateTheme._({
    required this.coreTextTheme,
    required this.inverseCoreTextTheme,
    required this.accentTextTheme,
    required this.disabledTextTheme,
    required this.exceptionsTextTheme,
    required this.colorsTheme,
    required this.isDarkTheme,
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
