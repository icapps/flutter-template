import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/general/text_scale_factor.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get/get.dart';

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
    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;

  const InternalApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const InternalApp.test({
    required this.home,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      create: () => getIt()..init(),
      lazy: FlavorConfig.isInTest(),
      consumer: (context, viewModel, consumerChild) => GetMaterialApp(
        debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: viewModel.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: FlutterTemplateThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: FlutterTemplateThemeData.darkTheme(viewModel.targetPlatform),
        initialRoute: home == null ? MainNavigator.initialRoute : null,
        getPages: MainNavigator.pages,
        home: home,
        builder: home == null
            ? (context, child) => TextScaleFactor(
                  child: child ?? const SizedBox.shrink(),
                )
            : null,
      ),
    );
  }
}
