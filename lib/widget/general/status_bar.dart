import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final bool isDarkStyle;

  /// StatusBar.dark will show a black status bar
  const StatusBar.dark({
    required this.child,
    Key? key,
  })  : isDarkStyle = true,
        super(key: key);

  /// StatusBar.light will show a white status bar
  const StatusBar.light({
    required this.child,
    Key? key,
  })  : isDarkStyle = false,
        super(key: key);

  /// StatusBar.animated will show:
  /// isDarkstyle == true => black status bar
  /// isDarkstyle == false => white status bar
  const StatusBar.animated({
    required this.child,
    required this.isDarkStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkStyle
          ? SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.transparent),
      child: child,
    );
  }
}
