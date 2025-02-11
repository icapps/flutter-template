import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

enum ButtonType {
  regular,
  text,
}

@widgetBookWidget
class FlutterTemplateButton extends StatelessWidget {
  @WidgetBookWidgetField(defaultValue: 'Button')
  final String text;
  final bool isEnabled;
  final bool isExpanded;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const FlutterTemplateButton({
    required this.text,
    required this.onClick,
    this.isExpanded = true,
    this.isEnabled = true,
    this.buttonType = ButtonType.regular,
    super.key,
  });

  const FlutterTemplateButton.text({
    required this.text,
    required this.onClick,
    this.isExpanded = false,
    this.isEnabled = true,
    this.buttonType = ButtonType.text,
    super.key,
  });

  TextStyle _enabledTextStyle(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.pureWhite.labelS;
      case ButtonType.text:
        return theme.accentThink.labelS;
    }
  }

  TextStyle _disabledTextStyle(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.pureWhite.labelS;
      case ButtonType.text:
        return theme.level2.labelS;
    }
  }

  Color? _enabledButtonColor(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.main;
      case ButtonType.text:
        return null;
    }
  }

  Color? _disabledButtonColor(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.level2;
      case ButtonType.text:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        final content = Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              child: AnimatedDefaultTextStyle(
                style: isEnabled ? _enabledTextStyle(theme) : _disabledTextStyle(theme),
                duration: ThemeDurations.shortAnimationDuration,
                child: Text(text),
              ),
            ),
          ],
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            borderRadius: BorderRadius.circular(12),
            onTapped: isEnabled ? onClick : null,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
                borderRadius: BorderRadius.circular(12),
              ),
              duration: ThemeDurations.shortAnimationDuration,
              child: content,
            ),
          );
        }
        return AnimatedContainer(
          decoration: BoxDecoration(
            color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
            borderRadius: BorderRadius.circular(12),
          ),
          duration: ThemeDurations.shortAnimationDuration,
          child: TouchFeedBack(
            borderRadius: BorderRadius.circular(12),
            onTapped: isEnabled ? onClick : null,
            child: content,
          ),
        );
      },
    );
  }
}
