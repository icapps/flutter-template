import 'package:flutte_template/navigator/main_navigator.dart';
import 'package:flutte_template/styles/theme_colors.dart';
import 'package:flutte_template/styles/theme_fonts.dart';
import 'package:flutte_template/util/locale/localization_delegate.dart';
import 'package:flutte_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutte_template/viewmodel/locale/locale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleViewModel>(
      child: Consumer<LocaleViewModel>(
        builder: (context, value, child) => MaterialApp(
              localizationsDelegates: [
                value.localeDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                FallbackCupertinoLocalisationsDelegate.delegate,
              ],
              locale: value.localeDelegate.activeLocale,
              supportedLocales: LocalizationDelegate.supportedLocales,
              theme: ThemeData(
                fontFamily: ThemeFonts.OpenSans,
                primaryColor: ThemeColors.primaryColor,
                accentColor: ThemeColors.accentColor,
              ),
              home: const MainNavigatorWidget(),
            ),
      ),
      builder: (context) => kiwi.Container().resolve()..init(),
    );
  }
}
