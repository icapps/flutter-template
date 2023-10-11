import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class TestApp extends StatelessWidget {
  final Widget home;
  final LocalizationDelegate? localeDelegate;

  const TestApp({
    required this.home,
    required this.localeDelegate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      create: () => getIt()..init(),
      lazy: true,
      consumer: (context, viewModel, consumerChild) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          if (localeDelegate == null && viewModel.localeDelegate != null) ...[
            viewModel.localeDelegate!
          ] else if (localeDelegate != null) ...[
            localeDelegate!,
          ],
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: viewModel.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: FlutterTemplateThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: FlutterTemplateThemeData.darkTheme(viewModel.targetPlatform),
        home: home,
      ),
    );
  }
}
