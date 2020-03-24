import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback_ios.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';

class TouchFeedBack extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final Color androidSplashColor;
  final Color color;
  final BorderRadius borderRadius;

  const TouchFeedBack({
    @required this.child,
    @required this.onClick,
    this.borderRadius,
    this.androidSplashColor,
    this.color = Colors.transparent,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isAndroid) {
      return _buildAndroid();
    }
    return TouchFeedBackIOS(
      child: child,
      onClick: onClick,
      color: color,
      borderRadius: borderRadius,
    );
  }

  Widget _buildAndroid() {
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
}
