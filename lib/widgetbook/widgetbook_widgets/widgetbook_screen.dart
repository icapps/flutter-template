import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';

class WidgetBookScreen extends StatelessWidget {
  final Widget child;

  const WidgetBookScreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.neutral80,
      body: Center(child: child),
    );
  }
}
