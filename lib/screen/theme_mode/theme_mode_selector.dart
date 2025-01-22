import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class ThemeModeSelectorScreen extends StatefulWidget {
  const ThemeModeSelectorScreen({super.key});

  @override
  ThemeModeSelectorScreenState createState() => ThemeModeSelectorScreenState();
}

@visibleForTesting
class ThemeModeSelectorScreenState extends State<ThemeModeSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugThemeSelectorViewModel>(
      create: getIt.call,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        title: 'Select a theme mode',
        isScrollable: true,
        children: [
          SelectorItem(
            title: localization.generalLabelSystemDefault,
            onClick: () => viewModel.updateThemeMode(ThemeMode.system),
            selected: viewModel.themeMode == ThemeMode.system,
          ),
          const SizedBox(height: 8),
          SelectorItem(
            title: localization.themeModeLabelLight,
            onClick: () => viewModel.updateThemeMode(ThemeMode.light),
            selected: viewModel.themeMode == ThemeMode.light,
          ),
          const SizedBox(height: 8),
          SelectorItem(
            title: localization.themeModeLabelDark,
            onClick: () => viewModel.updateThemeMode(ThemeMode.dark),
            selected: viewModel.themeMode == ThemeMode.dark,
          ),
        ],
      ),
    );
  }
}
