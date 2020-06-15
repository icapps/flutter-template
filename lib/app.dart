import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:kiwi/kiwi.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const InternalApp(
      home: MainNavigatorWidget(),
    );
  }
}

class InternalApp extends StatelessWidget {
  final Widget home;

  const InternalApp({@required this.home});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      consumerChild: home,
      lazy: FlavorConfig.isInTest(),
      consumer: (context, viewModel, child) => MaterialApp(
        debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
        localizationsDelegates: [
          viewModel.localeDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: LocalizationDelegate.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: FlutterTemplateThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: FlutterTemplateThemeData.darkTheme(viewModel.targetPlatform),
        home: child,
      ),
      create: () => KiwiContainer().resolve()..init(),
    );
  }
}
