import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';

class TextActionItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool enabled;
  final VoidCallback onClick;

  const TextActionItem({
    @required this.text,
    @required this.style,
    @required this.enabled,
    @required this.onClick,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TouchFeedBack(
        borderRadius: BorderRadius.circular(ThemeDimens.padding4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ThemeDimens.padding16, vertical: ThemeDimens.padding8),
          child: AnimatedDefaultTextStyle(
            style: style,
            child: Text(text),
            duration: ThemeDurations.shortAnimationDuration(),
          ),
        ),
        onClick: enabled ? onClick : null,
      ),
    );
  }
}
