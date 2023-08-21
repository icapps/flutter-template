import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  navigationType: NavigationType.popAllAndPush,
)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
        isDarkStyle: theme.isDarkTheme,
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
