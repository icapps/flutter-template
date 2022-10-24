import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class DebugRowTitle extends StatelessWidget {
  final String title;

  const DebugRowTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeDimens.padding16,
          vertical: ThemeDimens.padding8,
        ),
        color: theme.colorsTheme.debugTitleBackground,
        child: Text(
          title,
          style: theme.coreTextTheme.titleNormal,
        ),
      ),
    );
  }
}
