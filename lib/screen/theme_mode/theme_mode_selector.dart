import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
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
      create: getIt,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: FlutterTemplateBackButton.light(onClick: viewModel.onBackClicked),
          title: const Text('Select a theme mode'),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ListView(
          children: [
            SelectorItem(
              title: localization.generalLabelSystemDefault,
              onClick: () => viewModel.updateThemeMode(ThemeMode.system),
              selected: viewModel.themeMode == ThemeMode.system,
            ),
            SelectorItem(
              title: localization.themeModeLabelLight,
              onClick: () => viewModel.updateThemeMode(ThemeMode.light),
              selected: viewModel.themeMode == ThemeMode.light,
            ),
            SelectorItem(
              title: localization.themeModeLabelDark,
              onClick: () => viewModel.updateThemeMode(ThemeMode.dark),
              selected: viewModel.themeMode == ThemeMode.dark,
            ),
          ],
        ),
      ),
    );
  }
}
