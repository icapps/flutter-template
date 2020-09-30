import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/navigators/main_navigator.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
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
  final GlobalCubit overwriteCubit; // For testing

  const InternalApp({@required this.home, this.overwriteCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => overwriteCubit ?? KiwiContainer().resolve<GlobalCubit>()
        ..loadInitialState(),
      child: BlocBuilder<GlobalCubit, GlobalState>(
        buildWhen: (previous, current) =>
            previous.locale != current.locale ||
            previous.targetPlatform != current.targetPlatform ||
            previous.showsTranslationKeys != current.showsTranslationKeys ||
            previous.localizationDelegate != current.localizationDelegate,
        builder: (context, state) {
          if (state is LoadedGlobalState) {
            return buildContent(context, state: state);
            // } else if (state is LoadingGlobalState) {
            //   return buildContent(context); // Show a loading circle
          } else {
            // LoadingFailedGlobalState
            return buildContent(context); // Usually you will build an error build here
          }
        },
      ),
    );
  }

  Widget buildContent(BuildContext context, {GlobalState state}) {
    return MaterialApp(
      debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
      localizationsDelegates: [
        if (state != null) state.localizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FallbackCupertinoLocalisationsDelegate.delegate,
      ],
      locale: state?.localizationDelegate?.newLocale,
      supportedLocales: LocalizationDelegate.supportedLocales,
      themeMode: ThemeMode.system,
      theme: FlutterTemplateThemeData.lightTheme(state?.targetPlatform),
      darkTheme: FlutterTemplateThemeData.darkTheme(state?.targetPlatform),
      home: home,
    );
  }
}
