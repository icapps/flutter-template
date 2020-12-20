import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class FlutterTemplateProgressIndicator extends StatelessWidget {
  final bool dark;

  const FlutterTemplateProgressIndicator.dark() : dark = true;

  const FlutterTemplateProgressIndicator.light() : dark = false;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterTemplateTheme.of(context);
    if (FlavorConfig.isInTest()) {
      return Container(
        color: theme.colorsTheme.accent,
        height: 50,
        width: 50,
        child: const Text(
          'CircularProgressIndicator',
          style: TextStyle(fontSize: 8),
        ),
      );
    }
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(dark ? theme.colorsTheme.darkProgressIndicator : theme.colorsTheme.lightProgressIndicator),
    );
  }
}
