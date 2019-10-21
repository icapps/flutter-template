import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback_ios.dart';

class TouchFeedBack extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final bool animateEnabledState;
  final VoidCallback onClick;
  final Color androidSplashColor;
  final Color color;
  final BorderRadius borderRadius;

  const TouchFeedBack({
    @required this.child,
    @required this.onClick,
    this.enabled = true,
    this.animateEnabledState = false,
    this.borderRadius,
    this.androidSplashColor,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return _buildAndroid();
    }
    return TouchFeedBackIOS(
      child: child,
      enabled: enabled,
      animateEnabledState: animateEnabledState,
      onClick: onClick,
      color: color,
      borderRadius: borderRadius,
    );
  }

  Widget _buildAndroid() {
    if (animateEnabledState) {
      return AnimatedOpacity(
        opacity: enabled ? ThemeDimens.enabledOpacity : ThemeDimens.disabledOpacity,
        child: Material(
          borderRadius: borderRadius,
          color: color,
          child: enabled
              ? InkWell(
                  borderRadius: borderRadius,
                  splashColor: androidSplashColor,
                  onTap: onClick,
                  child: child,
                )
              : child,
        ),
        duration: ThemeDurations.shortAnimationDuration(),
      );
    }
    if (enabled) {
      return Material(
        borderRadius: borderRadius,
        color: color,
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: androidSplashColor,
          onTap: onClick,
          child: child,
        ),
      );
    }

    return Opacity(
      opacity: 0.24,
      child: Material(
        borderRadius: borderRadius,
        color: color,
        child: child,
      ),
    );
  }
}
