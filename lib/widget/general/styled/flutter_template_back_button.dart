import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class FlutterTemplateBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const FlutterTemplateBackButton.light({
    required this.onClick,
    this.fullScreen = false,
  }) : isLight = true;

  const FlutterTemplateBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
  }) : isLight = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: isLight ? theme.colorsTheme.lightIcon : theme.colorsTheme.darkIcon,
        onClick: onClick,
      ),
    );
  }

  String getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return ThemeAssets.closeIcon(context);
    }
    return ThemeAssets.backIcon(context);
  }
}
