import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
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
      childBuilderTheme: (context, theme) {
        return Container(
          height: 24,
          width: 42,
          decoration: BoxDecoration(
            color: value ? theme.accent : theme.disabled,
            borderRadius: ThemeDimens.circularBorderRadius,
          ),
          child: AnimatedAlign(
            duration: ThemeDurations.shortAnimationDuration,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(2),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: theme.background,
                borderRadius: ThemeDimens.circularBorderRadius,
              ),
            ),
          ),
        );
      },
    );
  }
}
