import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';

class DebugRowTitle extends StatelessWidget {
  final String title;

  const DebugRowTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeDimens.padding16,
        vertical: ThemeDimens.padding8,
      ),
      color: ThemeColors.disabledGrey,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
