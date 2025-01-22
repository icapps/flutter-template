import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class DebugRowTitle extends StatelessWidget {
  final String title;
  final String icon;

  const DebugRowTitle({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Row(
        children: [
          SvgIcon(
            svgAsset: icon,
            color: theme.fadedText,
            size: ThemeDimens.smallIconSize,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: theme.fadedText.bodySmall,
          ),
        ],
      ),
    );
  }
}
