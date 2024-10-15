import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/logging/logging_repository.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_template/widget/general/text_scale_factor.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // init logger
    getIt.get<LoggingRepository>().startLogging();

    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;
  final bool _isInTest;

  const InternalApp({super.key})
      : home = null,
        _isInTest = false;

  @visibleForTesting
  const InternalApp.test({
    required this.home,
    super.key,
  }) : _isInTest = true;

  @override
  Widget build(BuildContext context) {
    final MainNavigator mainNavigator = getIt();
    return ProviderWidget<GlobalViewModel>(
      create: () => getIt()..init(),
      lazy: _isInTest,
      consumer: (context, viewModel, consumerChild) => MaterialApp(
        navigatorKey: mainNavigator.navigatorKey,
        debugShowCheckedModeBanner: !_isInTest,
        localizationsDelegates: [
          if (viewModel.localeDelegate != null) viewModel.localeDelegate!,
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: viewModel.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: FlutterTemplateThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: FlutterTemplateThemeData.darkTheme(viewModel.targetPlatform),
        initialRoute: home == null ? MainNavigator.initialRoute : null,
        onGenerateRoute: mainNavigator.onGenerateRoute,
        home: home,
        builder: home == null
            ? (context, child) => FlavorBanner(
                  child: TextScaleFactor(
                    child: child ?? const SizedBox.shrink(),
                  ),
                )
            : null,
      ),
    );
  }
}
