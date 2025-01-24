import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:icapps_icons/icapps_icons.dart';

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
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TouchFeedBack(
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
              Icon(
                IcappsIcons.chevronRight,
                color: theme.icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
