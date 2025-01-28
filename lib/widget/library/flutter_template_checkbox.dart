import 'package:flutter/material.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:icapps_icons/icapps_icons.dart';

class FlutterTemplateCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FlutterTemplateCheckBox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOSTheme) {
      return DataProviderWidget(
        childBuilderTheme: (context, theme) => GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            color: Colors.transparent,
            height: 48,
            width: 48,
            child: value
                ? Center(
                    child: Icon(
                      IcappsIcons.checkmark,
                      color: theme.accentThink,
                      size: 24,
                    ),
                  )
                : Container(),
          ),
        ),
      );
    }
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Checkbox(
        value: value,
        onChanged: (value) => onChanged(value ?? false),
        activeColor: theme.accentThink,
      ),
    );
  }
}
