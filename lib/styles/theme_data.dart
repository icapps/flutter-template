import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
import 'package:flutter_template/util/env/os_config.dart';

class FlutterTemplateThemeData {
  FlutterTemplateThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: ThemeFonts.OpenSans,
    primaryColor: ThemeColors.primary,
    accentColor: ThemeColors.accent,
    cursorColor: ThemeColors.accent,
    textSelectionHandleColor: ThemeColors.accent,
    textSelectionColor: ThemeColors.accent.withOpacity(0.4),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: getCorrectPageTransitionBuilder(),
    }),
  );

  static final _lightThemeData = _darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }

  static PageTransitionsBuilder getCorrectPageTransitionBuilder() {
    if (!Platform.isAndroid) return const ZoomPageTransitionsBuilder();
    if (OsConfig.isAtLeastAndroid10) {
      return const ZoomPageTransitionsBuilder();
    } else if (OsConfig.isAtLeastPie) {
      return const OpenUpwardsPageTransitionsBuilder();
    }
    return const FadeUpwardsPageTransitionsBuilder();
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
  final TextStyle infoBodySubheader;
  final TextStyle bodyBig;

  const FlutterTemplateTextTheme({
    @required this.titleHuge,
    @required this.titleBig,
    @required this.titleNormal,
    @required this.titleSmall,
    @required this.titleListItem,
    @required this.labelButtonBig,
    @required this.labelButtonSmall,
    @required this.bodyNormal,
    @required this.bodySmall,
    @required this.bodyUltraSmall,
    @required this.infoBodySubheader,
    @required this.bodyBig,
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
    @required this.primary,
    @required this.secondary,
    @required this.accent,
    @required this.background,
    @required this.backgroundDark,
    @required this.inputFieldFill,
    @required this.disabled,
    @required this.lightIcon,
    @required this.darkIcon,
    @required this.lightProgressIndicator,
    @required this.darkProgressIndicator,
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
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans2, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans2, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans2),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans2),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans),
      infoBodySubheader: TextStyle(fontSize: 14, color: ThemeColors.primary, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.w600),
    ),
    lightTextTheme: FlutterTemplateTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans2, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans2, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans2),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans2),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans),
      infoBodySubheader: TextStyle(fontSize: 14, color: ThemeColors.white, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.w600),
    ),
    accentTextTheme: FlutterTemplateTextTheme(
      titleHuge: TextStyle(fontSize: 40, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans2, height: 1.2),
      titleBig: TextStyle(fontSize: 30, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans2, height: 1.2),
      titleNormal: TextStyle(fontSize: 24, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans2),
      titleSmall: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans2),
      titleListItem: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonBig: TextStyle(fontSize: 16, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      labelButtonSmall: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.bold),
      bodyBig: TextStyle(fontSize: 18, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      bodyNormal: TextStyle(fontSize: 16, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      bodySmall: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      bodyUltraSmall: TextStyle(fontSize: 12, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans),
      infoBodySubheader: TextStyle(fontSize: 14, color: ThemeColors.accent, fontFamily: ThemeFonts.OpenSans, fontWeight: FontWeight.w600),
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
    @required this.darkTextTheme,
    @required this.lightTextTheme,
    @required this.accentTextTheme,
    @required this.exceptionsTextTheme,
    @required this.colorsTheme,
  });

  static FlutterTemplateTheme of(BuildContext context) => _instanceDark;
}
