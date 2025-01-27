import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class FlutterTemplateInputField extends StatelessWidget {
  final bool enabled;
  final String hint;
  final List<String>? autoFillHints;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const FlutterTemplateInputField({
    required this.hint,
    required this.onChanged,
    this.autoFillHints,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TextField(
        style: theme.bodyNeutralDefault.bodyNormal,
        controller: controller,
        enabled: enabled,
        onChanged: onChanged,
        autofillHints: autoFillHints,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          hintStyle: theme.bodyNeutralDefault.bodyNormal,
          fillColor: theme.pureWhite,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.bodyNeutralDefault),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.main),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.bodyNeutralFaded),
          ),
        ),
      ),
    );
  }
}
