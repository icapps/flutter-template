import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class AnalyticsPermissionScreen extends StatelessWidget {
  static const String routeName = RouteNames.analyticsPermission;

  const AnalyticsPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AnalyticsPermissionViewModel>(
      create: getIt,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
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
                      SvgPicture.asset(
                        ThemeAssets.analyticsImage(context),
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
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
    );
  }
}
