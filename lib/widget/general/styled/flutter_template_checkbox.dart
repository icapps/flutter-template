import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';

class FlutterTemplateCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FlutterTemplateCheckBox({
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      return GestureDetector(
        onTap: () => onChanged(!value),
        child: Container(
          color: Colors.transparent,
          height: ThemeDimens.padding48,
          width: ThemeDimens.padding48,
          child: value
              ? Center(
                  child: SvgIcon(
                    svgAsset: ThemeAssets.doneIcon(context),
                    color: ThemeColors.accent,
                    size: ThemeDimens.padding24,
                  ),
                )
              : Container(),
        ),
      );
    }
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: ThemeColors.accent,
    );
  }
}
