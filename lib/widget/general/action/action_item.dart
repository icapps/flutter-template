import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';

class ActionItem extends StatelessWidget {
  final String svgAsset;
  final VoidCallback onClick;
  final Color color;

  const ActionItem({
    @required this.svgAsset,
    @required this.onClick,
    this.color = ThemeColors.white,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ThemeDimens.padding56,
      width: ThemeDimens.padding56,
      child: Center(
        child: Container(
          height: ThemeDimens.padding48,
          width: ThemeDimens.padding48,
          child: TouchFeedBack(
            borderRadius: BorderRadius.circular(ThemeDimens.padding48),
            child: Center(
              child: SvgIcon(
                svgAsset: svgAsset,
                size: ThemeDimens.padding24,
                color: color,
              ),
            ),
            onClick: onClick,
          ),
        ),
      ),
    );
  }
}
