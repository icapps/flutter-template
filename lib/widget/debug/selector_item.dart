import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';

class SelectorItem extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final bool selected;

  const SelectorItem({
    @required this.onClick,
    @required this.title,
    @required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return TouchFeedBack(
      child: Padding(
        padding: const EdgeInsets.all(ThemeDimens.padding16),
        child: Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            Opacity(
              opacity: selected ? 1 : 0,
              child: SvgIcon(
                svgAsset: ThemeAssets.doneIcon(context),
                color: ThemeColors.primary,
              ),
            ),
          ],
        ),
      ),
      onClick: onClick,
    );
  }
}
