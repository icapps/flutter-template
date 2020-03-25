import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> implements SplashNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => KiwiContainer.resolve()..init(this),
      childBuilderWithViewModel: (context, viewModel) => const Scaffold(
        backgroundColor: ThemeColors.primary,
        body: Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(ThemeColors.white)),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToLogin() => MainNavigatorWidget.of(context).goToLogin();
}
