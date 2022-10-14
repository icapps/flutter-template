import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class TextActionItem extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool enabled;
  final VoidCallback onClick;

  const TextActionItem({
    required this.text,
    required this.enabled,
    required this.onClick,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Center(
        child: TouchFeedBack(
          borderRadius: BorderRadius.circular(ThemeDimens.padding4),
          onClick: enabled ? onClick : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding16, vertical: ThemeDimens.padding8),
            child: AnimatedDefaultTextStyle(
              style: style ?? theme.inverseCoreTextTheme.labelButtonSmall,
              duration: ThemeDurations.shortAnimationDuration(),
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
