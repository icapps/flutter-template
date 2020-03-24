import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalViewModel>(
      child: Consumer<GlobalViewModel>(
        builder: (context, viewModel, child) => MaterialApp(
          localizationsDelegates: [
            viewModel.localeDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FallbackCupertinoLocalisationsDelegate.delegate,
          ],
          locale: viewModel.localeDelegate.activeLocale,
          supportedLocales: LocalizationDelegate.supportedLocales,
          theme: ThemeData(
            platform: viewModel.targetPlatform,
            fontFamily: ThemeFonts.OpenSans,
            primaryColor: ThemeColors.primary,
            accentColor: ThemeColors.accent,
          ),
          home: const MainNavigatorWidget(),
        ),
      ),
      create: (context) => KiwiContainer.resolve()..init(),
    );
  }
}
