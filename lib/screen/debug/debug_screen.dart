import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/general/responsive/response_widget.dart';
import 'package:flutter_template/widget/provider/provider_widet.dart';
import 'package:provider/provider.dart';

class DebugScreen extends StatefulWidget {
  static const String routeName = 'debug';

  @override
  _DebugScreenState createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> implements DebugNavigator {
  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return ProviderWidget<DebugViewModel>(
      consumer: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Debug'),
        ),
        body: ResponsiveWidget(
          builder: (context, info) => ListView(
            children: [
              const DebugRowTitle(title: 'Animations'),
              DebugRowSwitchItem(
                title: 'Slow Animations',
                value: viewModel.slowAnimationsEnabled,
                onChanged: viewModel.onSlowAnimationsChanged,
              ),
              const DebugRowTitle(title: 'Theme'),
              DebugRowItem(
                title: 'Target Platform',
                subTitle: 'Current Platform: ${Provider.of<GlobalViewModel>(context).getCurrentPlatform(localization)}',
                onClick: viewModel.onTargetPlatformClicked,
              ),
            ],
          ),
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }

  @override
  Future<void> goToTargetPlatformSelector() => MainNavigatorWidget.of(context).goToDebugPlatformSelector();
}
