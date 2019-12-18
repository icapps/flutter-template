import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/platform_selector/platform_selector_item.dart';
import 'package:flutter_template/widget/provider/provider_widet.dart';
import 'package:provider/provider.dart';

class DebugPlatformSelectorScreen extends StatelessWidget implements DebugPlatformSelectorNavigator {
  static const String routeName = 'debug_platform_selector';

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorViewModel>(
      childBuilderWithViewModel: (context, value) => Scaffold(
        appBar: AppBar(
          title: const Text('Select a platform'),
        ),
        body: Consumer<GlobalViewModel>(
          builder: (context, viewModel, child) => ListView(
            children: [
              PlatformSelectedItem(
                title: 'System Default',
                onClick: viewModel.setSelectedPlatformToDefault,
                selected: viewModel.targetPlatform == null,
              ),
              PlatformSelectedItem(
                title: 'Android',
                onClick: viewModel.setSelectedPlatformToAndroid,
                selected: viewModel.targetPlatform == TargetPlatform.android,
              ),
              PlatformSelectedItem(
                title: 'iOS',
                onClick: viewModel.setSelectedPlatformToIOS,
                selected: viewModel.targetPlatform == TargetPlatform.iOS,
              ),
            ],
          ),
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }
}
