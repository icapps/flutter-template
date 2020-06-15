import 'package:kiwi/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> implements SplashNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => KiwiContainer().resolve()..init(this),
      childBuilderWithViewModel: (context, viewModel) => const Scaffold(
        backgroundColor: ThemeColors.primary,
        body: Center(child: FlutterTemplateProgressIndicator.light()),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToLogin() => MainNavigatorWidget.of(context).goToLogin();
}
