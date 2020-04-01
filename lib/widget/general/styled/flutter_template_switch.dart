import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';

class FlutterTemplateSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FlutterTemplateSwitch({
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value ?? false,
      onChanged: onChanged,
      activeColor: ThemeColors.accent,
    );
  }
}
