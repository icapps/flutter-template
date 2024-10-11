import 'package:flutter/material.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class FlutterTemplateSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FlutterTemplateSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: theme.accent,
        inactiveTrackColor: theme.disabled,
      ),
    );
  }
}
