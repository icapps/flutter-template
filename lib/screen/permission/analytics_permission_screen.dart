import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.get_x_navigator.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@getXRoute
class AnalyticsPermissionScreen extends StatelessWidget {
  static const String routeName = RouteNames.analyticsPermissionScreen;

  const AnalyticsPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AnalyticsPermissionViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: theme.isDarkTheme ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.permissionScreenBackground,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: SvgPicture.asset(
                            ThemeAssets.analyticsImage(context),
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 32),
                        Text(
                          localization.permissionAnalyticsTitle,
                          style: theme.coreTextTheme.titleNormal,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          localization.permissionAnalyticsDescription,
                          textAlign: TextAlign.center,
                          style: theme.coreTextTheme.bodyNormal,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FlutterTemplateButton(
                  text: localization.permissionButtonAccept,
                  onClick: viewModel.onAcceptClicked,
                ),
                const SizedBox(height: 8),
                FlutterTemplateButton.text(
                  text: localization.permissionButtonMoreInfo,
                  onClick: viewModel.onMoreInfoClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
