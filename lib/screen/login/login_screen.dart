import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
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
                  if (viewModel.isLoading) ...[
                    const FlutterTemplateProgressIndicator.light(),
                  ] else ...[
                    FlutterTemplateButton(
                      key: Keys.loginButton,
                      isEnabled: viewModel.isLoginEnabled,
                      text: 'Login',
                      onClick: viewModel.onLoginClicked,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
