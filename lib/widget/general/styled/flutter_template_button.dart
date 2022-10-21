import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
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
  final double height;
  final bool isEnabled;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const FlutterTemplateButton({
    required this.text,
    required this.onClick,
    this.height = 48,
    this.isEnabled = true,
    this.buttonType = ButtonType.regular,
    super.key,
  });

  const FlutterTemplateButton.text({
    required this.text,
    required this.onClick,
    this.height = 48,
    this.isEnabled = true,
    this.buttonType = ButtonType.text,
    super.key,
  });

  TextStyle _enabledTextStyle(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.coreTextTheme.labelButtonSmall;
      case ButtonType.text:
        return theme.coreTextTheme.labelButtonSmall.copyWith(color: theme.colorsTheme.textButtonText);
    }
  }

  TextStyle _disabledTextStyle(FlutterTemplateTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.coreTextTheme.labelButtonSmallDisabled;
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
        return theme.isDarkTheme ? ThemeColors.white50 : theme.colorsTheme.disabled;
      case ButtonType.text:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        final content = Center(
          child: AnimatedDefaultTextStyle(
            style: isEnabled ? _enabledTextStyle(theme) : _disabledTextStyle(theme),
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
