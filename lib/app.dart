import 'package:flutte_template/navigator/main_navigator.dart';
import 'package:flutte_template/styles/theme_colors.dart';
import 'package:flutte_template/styles/theme_fonts.dart';
import 'package:flutte_template/util/locale/localization.dart';
import 'package:flutte_template/util/locale/localization_delegate.dart';
import 'package:flutte_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        LocalizationDelegate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FallbackCupertinoLocalisationsDelegate.delegate,
      ],
      supportedLocales: Localization.supportedLanguages,
      theme: ThemeData(
        fontFamily: ThemeFonts.OpenSans,
        primaryColor: ThemeColors.primaryColor,
        accentColor: ThemeColors.accentColor,
      ),
      home: const MainNavigatorWidget(),
    );
  }
}
