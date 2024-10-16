import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/simple_screen/base_screen.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class DebugPlatformSelectorScreen extends StatefulWidget {
  const DebugPlatformSelectorScreen({super.key});

  @override
  DebugPlatformSelectorScreenState createState() => DebugPlatformSelectorScreenState();
}

@visibleForTesting
class DebugPlatformSelectorScreenState extends State<DebugPlatformSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorViewModel>(
      create: getIt.call,
      consumerWithThemeAndLocalization: (context, viewModel, _, theme, localization) => BaseScreen(
        title: 'Select a platform',
        isScrollable: true,
        children: [
          SelectorItem(
            title: localization.generalLabelSystemDefault,
            onClick: viewModel.setSelectedPlatformToDefault,
            selected: viewModel.selectedPlatform == null,
          ),
          SelectorItem(
            title: localization.generalLabelAndroid,
            onClick: viewModel.setSelectedPlatformToAndroid,
            selected: viewModel.selectedPlatform == TargetPlatform.android,
          ),
          SelectorItem(
            title: localization.generalLabelIos,
            onClick: viewModel.setSelectedPlatformToIOS,
            selected: viewModel.selectedPlatform == TargetPlatform.iOS,
          )
        ],
      ),
    );
  }
}
