import 'package:flutter/material.dart';

class FadeInRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Curve curve;
  final Alignment alignment;
  final Duration duration;

  FadeInRoute({
    @required this.child,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
        );
}
