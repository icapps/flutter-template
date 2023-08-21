import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

enum ButtonType {
  regular,
  text,
}

class FlutterTemplateButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final bool isExpanded;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const FlutterTemplateButton({
    required this.text,
    required this.onClick,
    this.isExpanded = false,
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
        return theme.inverseCoreTextTheme.labelButtonSmall;
      case ButtonType.text:
        return theme.accentTextTheme.labelButtonSmall;
    }
  }

  TextStyle _disabledTextStyle(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.inverseCoreTextTheme.labelButtonSmall;
      case ButtonType.text:
        return theme.coreTextTheme.labelButtonSmallDisabled;
    }
  }

  Color? _enabledButtonColor(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.colorsTheme.buttonColor;
      case ButtonType.text:
        return null;
    }
  }

  Color? _disabledButtonColor(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.colorsTheme.disabled;
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
                vertical: 12,
                horizontal: 24,
              ),
              child: AnimatedDefaultTextStyle(
                style: isEnabled ? _enabledTextStyle(theme) : _disabledTextStyle(theme),
                duration: ThemeDurations.shortAnimationDuration(),
                child: Text(text),
              ),
            ),
          ],
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: AnimatedContainer(
              color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
              duration: ThemeDurations.shortAnimationDuration(),
              child: content,
            ),
          );
        }
        return AnimatedContainer(
          color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
          duration: ThemeDurations.shortAnimationDuration(),
          child: TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: content,
          ),
        );
      },
    );
  }
}
