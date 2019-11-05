import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlackStatusBar extends StatelessWidget {
  final Widget child;

  const BlackStatusBar({@required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
