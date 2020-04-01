import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';

class FlutterTemplateBackButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool fullScreen;
  final Color color;

  const FlutterTemplateBackButton.light({
    @required this.onClick,
    this.fullScreen = false,
  }) : color = ThemeColors.white;

  const FlutterTemplateBackButton.dark({
    @required this.onClick,
    this.fullScreen = false,
  }) : color = ThemeColors.black;

  @override
  Widget build(BuildContext context) {
    if (color == ThemeColors.white) {
      return ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: ThemeColors.white,
        onClick: onClick,
      );
    }
    return ActionItem(
      key: Keys.backButton,
      svgAsset: getCorrectIcon(context),
      color: ThemeColors.black,
      onClick: onClick,
    );
  }

  String getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return ThemeAssets.closeIcon(context);
    }
    return ThemeAssets.backIcon(context);
  }
}
