// ignore_for_file: deprecated_member_use
// TODO: Update to v2.10 and remove this ignore https://github.com/icapps/flutter-template/issues/238
import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class FlutterTemplateThemeData {
  FlutterTemplateThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: ThemeFonts.openSans,
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryVariant: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryVariant: ThemeColors.accent,
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
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color inputFieldFill;
  final Color disabled;
  final Color lightIcon;
  final Color darkIcon;
  final Color lightProgressIndicator;
  final Color darkProgressIndicator;

  const FlutterTemplateColorsTheme({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.inputFieldFill,
    required this.disabled,
    required this.lightIcon,
    required this.darkIcon,
    required this.lightProgressIndicator,
    required this.darkProgressIndicator,
  });
}

class FlutterTemplateTheme {
  final FlutterTemplateTextTheme darkTextTheme;
  final FlutterTemplateTextTheme lightTextTheme;
  final FlutterTemplateTextTheme accentTextTheme;
  final FlutterTemplateTextThemeExceptions exceptionsTextTheme;
  final FlutterTemplateColorsTheme colorsTheme;

  static const _instanceDark = FlutterTemplateTheme._(
    darkTextTheme: FlutterTemplateTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.black, fontFamily: ThemeFonts.openSans, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.black, fontFamily: ThemeFonts.openSans, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.black, fontFamily: ThemeFonts.openSans),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.black, fontFamily: ThemeFonts.openSans),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.black, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.black, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.black, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.black, fontFamily: ThemeFonts.openSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.black, fontFamily: ThemeFonts.openSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.black, fontFamily: ThemeFonts.openSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.black, fontFamily: ThemeFonts.openSans),
      infoBodySubHeader: TextStyle(fontSize: 14, color: ThemeColors.black, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.w600),
    ),
    lightTextTheme: FlutterTemplateTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.white, fontFamily: ThemeFonts.openSans, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.white, fontFamily: ThemeFonts.openSans, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.white, fontFamily: ThemeFonts.openSans),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.openSans),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.white, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.openSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.white, fontFamily: ThemeFonts.openSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.openSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.white, fontFamily: ThemeFonts.openSans),
      infoBodySubHeader: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.w600),
    ),
    accentTextTheme: FlutterTemplateTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans),
      infoBodySubHeader: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.openSans, fontWeight: FontWeight.w600),
    ),
    exceptionsTextTheme: FlutterTemplateTextThemeExceptions(),
    colorsTheme: FlutterTemplateColorsTheme(
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.white,
      background: ThemeColors.white,
      backgroundDark: ThemeColors.primary,
      inputFieldFill: ThemeColors.white,
      disabled: ThemeColors.disabledGrey,
      lightIcon: ThemeColors.white,
      darkIcon: ThemeColors.black,
      darkProgressIndicator: ThemeColors.primary,
      lightProgressIndicator: ThemeColors.white,
    ),
  );

  const FlutterTemplateTheme._({
    required this.darkTextTheme,
    required this.lightTextTheme,
    required this.accentTextTheme,
    required this.exceptionsTextTheme,
    required this.colorsTheme,
  });

  static FlutterTemplateTheme of(BuildContext context) => _instanceDark;
}
