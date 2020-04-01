import 'package:flutter/material.dart';

class TouchFeedBackIOS extends StatefulWidget {
  final Widget child;
  final VoidCallback onClick;
  final Color color;
  final BorderRadius borderRadius;

  const TouchFeedBackIOS({
    @required this.child,
    @required this.onClick,
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
    return GestureDetector(
      onTapDown: (details) => _setTouched(true),
      onTap: widget.onClick,
      onTapCancel: () => _setTouched(false),
      onTapUp: (details) => _setTouched(false),
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

  void _setTouched(bool touched) {
    if (widget.onClick == null) return;
    setState(() => this.touched = touched);
  }
}
