import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class FlutterTemplateProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isInTest()) {
      return Container(
        color: ThemeColors.accent,
        height: 50,
        width: 50,
        child: const Text(
          'CircularProgressIndicator',
          style: TextStyle(fontSize: 8),
        ),
      );
    }
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(ThemeColors.white),
    );
  }
}
