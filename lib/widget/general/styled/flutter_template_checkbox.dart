import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';
import 'package:flutter_template/styles/theme_dimens.dart';

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
      return Container(
        height: ThemeDimens.padding48,
        width: ThemeDimens.padding48,
        child: value ? Icon(Icons.check) : Container(),
      );
    }
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: ThemeColors.accent,
    );
  }
}
