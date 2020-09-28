import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/login/login_cubit.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/navigators/error_navigator.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/navigators/main_navigator.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_text_styles.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/status_bar.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_input_field.dart';
import 'package:kiwi/kiwi.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ErrorNavigatorMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'LoginScaffoldKey');
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: buildContent,
        listener: (context, state) {
          if (state is ErrorLoginState) {
            if (state.error is FlutterTemplateError) {
              showErrorWithLocaleKey(state.error.getLocalizedKey(), context);
            } else {
              showErrorWithLocaleKey(LocalizationKeys.errorGeneral, context);
            }
          } else if (state is LoadedLoginState) {
            goToHome();
          }
        },
      ),
    );
  }

  Widget buildContent(BuildContext context, LoginState state) {
    return StatusBar.light(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ThemeColors.primary,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(ThemeDimens.padding16),
            child: Column(
              children: [
                Container(height: ThemeDimens.padding16),
                const Text(
                  'Login',
                  style: ThemeTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                Container(height: ThemeDimens.padding32),
                const Text(
                  'Just fill in some text. There is no validator for the login',
                  style: ThemeTextStyles.lightButtonTextStyle,
                ),
                Container(height: ThemeDimens.padding32),
                FlutterTemplateInputField(
                  key: Keys.emailInput,
                  enabled: state is InitialLoginState || state is ErrorLoginState,
                  onChanged: (newValue) => setState(() => email = newValue),
                  hint: 'Email',
                ),
                Container(height: ThemeDimens.padding16),
                FlutterTemplateInputField(
                  key: Keys.passwordInput,
                  enabled: state is InitialLoginState || state is ErrorLoginState,
                  onChanged: (newValue) => setState(() => password = newValue),
                  hint: 'Password',
                ),
                Container(height: ThemeDimens.padding16),
                if (state is LoadingLoginState) ...{
                  const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.white)),
                } else if (state is InitialLoginState || state is ErrorLoginState) ...{
                  FlutterTemplateButton(
                    key: Keys.loginButton,
                    isEnabled: password != null && password.isNotEmpty && email != null && email.isNotEmpty,
                    text: 'Login',
                    onClick: () => context.bloc<LoginCubit>().onLoginClicked(email, password),
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToHome() => MainNavigatorWidget.of(context).goToHome();
}
