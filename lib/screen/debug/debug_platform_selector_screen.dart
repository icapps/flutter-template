import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/theme_widget.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:provider/provider.dart';

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
      consumerWithThemeAndLocalization: (context, value, _, theme, localization) => ThemeWidget(
        child: Scaffold(
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
      ),
    );
  }
}
