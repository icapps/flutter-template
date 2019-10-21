import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class TouchFeedBackIOS extends StatefulWidget {
  final Widget child;
  final bool enabled;
  final bool animateEnabledState;
  final VoidCallback onClick;
  final Color color;
  final BorderRadius borderRadius;

  const TouchFeedBackIOS({
    @required this.child,
    @required this.onClick,
    this.enabled = true,
    this.animateEnabledState = false,
    this.borderRadius,
    this.color = Colors.transparent,
  });

  @override
  _TouchFeedBackIOSState createState() => _TouchFeedBackIOSState();
}

class _TouchFeedBackIOSState extends State<TouchFeedBackIOS> {
  static const touchScale = 0.98;
  static const defaultScale = 1.0;
  var touched = false;

  @override
  Widget build(BuildContext context) {
    if (widget.animateEnabledState) {
      return GestureDetector(
        onTapDown: (details) => setState(() => touched = true),
        onTap: () {
          if (widget.enabled) widget.onClick();
        },
        onTapCancel: () => setState(() => touched = false),
        onTapUp: (details) => setState(() => touched = false),
        child: Transform.scale(
          scale: widget.enabled && touched ? touchScale : defaultScale,
          child: AnimatedOpacity(
            opacity: widget.enabled ? ThemeDimens.enabledOpacity : ThemeDimens.disabledOpacity,
            child: Material(
              borderRadius: widget.borderRadius,
              color: widget.color,
              child: widget.child,
            ),
            duration: ThemeDurations.shortAnimationDuration(),
          ),
        ),
      );
    }
    if (widget.enabled) {
      return GestureDetector(
        onTapDown: (details) => setState(() => touched = true),
        onTap: widget.onClick,
        onTapCancel: () => setState(() => touched = false),
        onTapUp: (details) => setState(() => touched = false),
        child: Transform.scale(
          scale: touched ? touchScale : defaultScale,
          child: Material(
            borderRadius: widget.borderRadius,
            color: widget.color,
            child: widget.child,
          ),
        ),
      );
    }
    return _buildDisabledState();
  }

  Widget _buildDisabledState() {
    return Opacity(
      opacity: 0.24,
      child: Material(
        borderRadius: widget.borderRadius,
        color: widget.color,
        child: widget.child,
      ),
    );
  }
}
