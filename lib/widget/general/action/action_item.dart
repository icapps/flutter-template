import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class ActionItem extends StatelessWidget {
  final String svgAsset;
  final VoidCallback? onClick;
  final Color? color;

  const ActionItem({
    required this.svgAsset,
    required this.onClick,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => SizedBox(
        height: 48,
        width: 48,
        child: Center(
          child: SizedBox(
            height: 48,
            width: 48,
            child: TouchFeedBack(
              borderRadius: BorderRadius.circular(48),
              onTapped: onClick,
              child: Center(
                child: SvgIcon(
                  svgAsset: svgAsset,
                  size: 24,
                  color: color ?? theme.icon,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
