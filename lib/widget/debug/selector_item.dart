import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/general/svg_icon.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class SelectorItem extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final bool selected;

  const SelectorItem({
    required this.onClick,
    required this.title,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TouchFeedBack(
        onTapped: onClick,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selected ? theme.fillInformative : theme.inverseBackground,
            border: Border.all(
              color: selected ? theme.accent : theme.inverseBackground,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.text.bodyNormal,
                  ),
                ),
                Opacity(
                  opacity: selected ? 1 : 0,
                  child: SvgIcon(
                    svgAsset: ThemeAssets.checkIcon,
                    color: theme.accent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
