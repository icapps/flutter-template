import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class FlutterTemplateButton extends StatelessWidget {
  final String text;
  final double height;
  final bool isEnabled;
  final VoidCallback? onClick;

  const FlutterTemplateButton({
    required this.text,
    required this.onClick,
    this.height = 48,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        final content = Center(
          child: AnimatedDefaultTextStyle(
            style: isEnabled
                ? theme.inverseCoreTextTheme.labelButtonSmall
                : theme.coreTextTheme.labelButtonSmallDisabled,
            duration: ThemeDurations.shortAnimationDuration(),
            child: Text(
              text,
            ),
          ),
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: AnimatedContainer(
              height: height,
              color: isEnabled
                  ? theme.colorsTheme.accent
                  : theme.colorsTheme.disabled,
              duration: ThemeDurations.shortAnimationDuration(),
              child: content,
            ),
          );
        }
        return AnimatedContainer(
          color:
              isEnabled ? theme.colorsTheme.accent : theme.colorsTheme.disabled,
          duration: ThemeDurations.shortAnimationDuration(),
          child: TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: SizedBox(
              height: height,
              child: content,
            ),
          ),
        );
      },
    );
  }
}
