import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:flutter_template/util/extension/text_style_extensions.dart';

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
            child: Text(
              text,
            ),
            style: isEnabled ? theme.lightTextTheme.labelButtonSmall : theme.darkTextTheme.labelButtonSmall.withOpacity20(),
            duration: ThemeDurations.shortAnimationDuration(),
          ),
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            child: AnimatedContainer(
              height: height,
              child: content,
              color: isEnabled ? theme.colorsTheme.accent : theme.colorsTheme.disabled,
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
          color: isEnabled ? theme.colorsTheme.accent : theme.colorsTheme.disabled,
          duration: ThemeDurations.shortAnimationDuration(),
        );
      },
    );
  }
}
