import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class FlutterTemplateInputField extends StatelessWidget {
  final String hint;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const FlutterTemplateInputField({
    required this.hint,
    required this.onChanged,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TextField(
        style: theme.text.bodyNormal,
        controller: controller,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          hintStyle: theme.inputFieldHint.bodyNormal,
          fillColor: theme.inputFieldFill,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.inputFieldBorderEnabled),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.inputFieldBorderFocused),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.bottomNavbarItemInactive),
          ),
        ),
      ),
    );
  }
}
