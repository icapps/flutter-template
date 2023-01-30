import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.get_x_navigator.dart';
import 'package:flutter_template/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flutter_template/navigator/middle_ware/authentication_guard.dart';
import 'package:flutter_template/navigator/middle_ware/debug_guard.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:provider/provider.dart';

@GetXRoute(
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
    DebugGuard,
  ],
)
class DebugPlatformSelectorScreen extends StatefulWidget {
  static const String routeName = RouteNames.debugPlatformSelectorScreen;

  const DebugPlatformSelectorScreen({super.key});

  @override
  DebugPlatformSelectorScreenState createState() => DebugPlatformSelectorScreenState();
}

@visibleForTesting
class DebugPlatformSelectorScreenState extends State<DebugPlatformSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorViewModel>(
      create: getIt,
      consumerWithThemeAndLocalization: (context, value, _, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: FlutterTemplateBackButton.light(onClick: value.onBackClicked),
          title: const Text('Select a platform'),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: Consumer<GlobalViewModel>(
          builder: (context, viewModel, child) => ListView(
            children: [
              SelectorItem(
                title: localization.generalLabelSystemDefault,
                onClick: viewModel.setSelectedPlatformToDefault,
                selected: viewModel.targetPlatform == null,
              ),
              SelectorItem(
                title: localization.generalLabelAndroid,
                onClick: viewModel.setSelectedPlatformToAndroid,
                selected: viewModel.targetPlatform == TargetPlatform.android,
              ),
              SelectorItem(
                title: localization.generalLabelIos,
                onClick: viewModel.setSelectedPlatformToIOS,
                selected: viewModel.targetPlatform == TargetPlatform.iOS,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
