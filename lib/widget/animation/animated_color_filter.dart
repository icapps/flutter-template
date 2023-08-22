import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';

class AnimatedColorFilter extends StatelessWidget {
  final Color? color;
  final Widget Function(BuildContext, Color) builder;

  const AnimatedColorFilter({
    required this.color,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: Colors.white, end: color ?? Colors.transparent),
      duration: ThemeDurations.shortAnimationDuration(),
      builder: (_, color, __) => builder(context, color ?? Colors.transparent),
    );
  }
}
