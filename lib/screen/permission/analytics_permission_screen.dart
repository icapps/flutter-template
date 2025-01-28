import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class AnalyticsPermissionScreen extends StatelessWidget {
  const AnalyticsPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AnalyticsPermissionViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        showHeader: false,
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
                      ThemeAssets.analyticsImage,
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 32),
                  Text(
                    localization.permissionAnalyticsTitle,
                    style: theme.bodyNeutralDefault.headingS,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    localization.permissionAnalyticsDescription,
                    textAlign: TextAlign.center,
                    style: theme.bodyNeutralDefault.paragraphM,
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
    );
  }
}
