import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/middle_ware/login_guard.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/general/theme_widget.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_interface/get_x_navigation_generator_interface.dart';
import 'package:provider/provider.dart';

@GetXRoute(
  navigationType: NavigationType.popAllAndPush,
  middlewares: [LoginGuard],
)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      child: ProviderWidget<LoginViewModel>(
        create: () => getIt()..init(),
        childBuilder: (context, theme, _) => Consumer<LoginViewModel>(
          builder: (context, viewModel, child) => StatusBar.animated(
            isDarkStyle: theme.isDarkTheme,
            child: Scaffold(
              backgroundColor: theme.colorsTheme.background,
              body: SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(ThemeDimens.padding16),
                  child: Column(
                    children: [
                      Container(height: ThemeDimens.padding16),
                      Text(
                        'Login',
                        style: theme.coreTextTheme.titleNormal,
                        textAlign: TextAlign.center,
                      ),
                      Container(height: ThemeDimens.padding32),
                      Text(
                        'Just fill in some text. There is no validator for the login',
                        style: theme.coreTextTheme.labelButtonSmall,
                      ),
                      Container(height: ThemeDimens.padding32),
                      FlutterTemplateInputField(
                        key: Keys.emailInput,
                        enabled: !viewModel.isLoading,
                        onChanged: viewModel.onEmailUpdated,
                        hint: 'Email',
                      ),
                      Container(height: ThemeDimens.padding16),
                      FlutterTemplateInputField(
                        key: Keys.passwordInput,
                        enabled: !viewModel.isLoading,
                        onChanged: viewModel.onPasswordUpdated,
                        hint: 'Password',
                      ),
                      Container(height: ThemeDimens.padding16),
                      if (viewModel.isLoading) ...{
                        const FlutterTemplateProgressIndicator.light(),
                      } else
                        FlutterTemplateButton(
                          key: Keys.loginButton,
                          isEnabled: viewModel.isLoginEnabled,
                          text: 'Login',
                          onClick: viewModel.onLoginClicked,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
