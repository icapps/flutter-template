import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';

class FlutterTemplateInputField extends StatelessWidget {
  final String hint;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const FlutterTemplateInputField({
    @required this.hint,
    @required this.onChanged,
    this.enabled = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        fillColor: ThemeColors.white,
      ),
      onChanged: onChanged,
    );
  }
}
