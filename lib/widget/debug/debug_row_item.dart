import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DebugRowItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback onClick;

  const DebugRowItem({
    required this.title,
    required this.onClick,
    this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(childBuilderTheme: (context, theme) {
      return TouchFeedBack(
        onTapped: onClick,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.text.bodyBig,
                    ),
                    if (subTitle != null) ...[
                      Container(height: 8),
                      Text(
                        subTitle!,
                        style: theme.text.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
              const SvgIcon(
                svgAsset: ThemeAssets.chevronRightIcon,
              ),
            ],
          ),
        ),
      );
    });
  }
}
