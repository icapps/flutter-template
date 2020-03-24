import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/styles/theme_text_styles.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';

class FlutterTemplateButton extends StatelessWidget {
  final String text;
  final double height;
  final bool isEnabled;
  final VoidCallback onClick;

  const FlutterTemplateButton({
    @required this.text,
    @required this.onClick,
    this.height = 48,
    this.isEnabled = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: AnimatedDefaultTextStyle(
        child: Text(
          text,
        ),
        style: isEnabled ? ThemeTextStyles.lightButtonTextStyle : ThemeTextStyles.disabledButtonTextStyle,
        duration: ThemeDurations.shortAnimationDuration(),
      ),
    );
    if (context.isIOS) {
      return TouchFeedBack(
        child: AnimatedContainer(
          height: height,
          child: content,
          color: isEnabled ? ThemeColors.primary : ThemeColors.disabledGrey,
          duration: ThemeDurations.shortAnimationDuration(),
        ),
        onClick: isEnabled ? onClick : null,
      );
    }
    return AnimatedContainer(
      child: TouchFeedBack(
        child: Container(
          height: height,
          child: content,
        ),
        onClick: isEnabled ? onClick : null,
      ),
      color: isEnabled ? ThemeColors.primary : ThemeColors.disabledGrey,
      duration: ThemeDurations.shortAnimationDuration(),
    );
  }
}
