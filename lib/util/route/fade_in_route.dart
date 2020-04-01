import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class FadeInRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Curve curve;
  final Alignment alignment;
  final Duration duration;

  FadeInRoute({
    @required this.child,
    this.curve = Curves.linear,
    this.alignment,
    RouteSettings settings,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          settings: settings,
          transitionDuration: FlavorConfig.isInTest() ? const Duration(seconds: 0) : duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
