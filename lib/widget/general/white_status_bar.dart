import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WhiteStatusBar extends StatelessWidget {
  final Widget child;

  const WhiteStatusBar({@required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
