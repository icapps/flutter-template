import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
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
        onClick: onClick,
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.coreTextTheme.bodyBig,
                    ),
                    if (subTitle != null) ...[
                      Container(height: ThemeDimens.padding4),
                      Text(
                        subTitle!,
                        style: theme.coreTextTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
