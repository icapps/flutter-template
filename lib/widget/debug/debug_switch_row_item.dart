import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_switch.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DebugRowSwitchItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const DebugRowSwitchItem({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(childBuilderTheme: (context, theme) {
      return TouchFeedBack(
        onTapped: () => onChanged(!value),
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
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: theme.text.bodySmall,
                      ),
                  ],
                ),
              ),
              FlutterTemplateSwitch(
                value: value,
                onChanged: onChanged,
              )
            ],
          ),
        ),
      );
    });
  }
}
