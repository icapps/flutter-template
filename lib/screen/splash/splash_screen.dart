import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigators/main_navigator.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:kiwi/kiwi.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<SplashCubit>()..checkLoggedIn(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is LoadedSplashState) {
            init(context, isLoggedIn: state?.isLoggedIn);
          }
        },
        child: const Scaffold(
          backgroundColor: ThemeColors.primary,
          body: Center(child: FlutterTemplateProgressIndicator.light()),
        ),
      ),
    );
  }

  Future<void> init(BuildContext context, {bool isLoggedIn}) async {
    if (isLoggedIn) {
      goToHome(context);
    } else {
      goToLogin(context);
    }
  }

  void goToHome(BuildContext context) => MainNavigatorWidget.of(context).goToHome();

  void goToLogin(BuildContext context) => MainNavigatorWidget.of(context).goToLogin();
}
