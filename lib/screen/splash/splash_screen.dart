import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = RouteNames.splashScreen;

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => GetIt.I()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.light(
        child: Scaffold(
          backgroundColor: theme.colorsTheme.primary,
          body: const Center(
            child: FlutterTemplateProgressIndicator.light(),
          ),
        ),
      ),
    );
  }
}
