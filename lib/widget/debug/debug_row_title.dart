import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_dimens.dart';

class DebugRowTitle extends StatelessWidget {
  final String title;

  const DebugRowTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = FlutterTemplateTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeDimens.padding16,
        vertical: ThemeDimens.padding8,
      ),
      color: theme.colorsTheme.disabled,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
