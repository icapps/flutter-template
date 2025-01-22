import 'package:flutter/material.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DebugSection extends StatelessWidget {
  final String title;
  final String icon;
  final List<Widget> children;

  const DebugSection({
    required this.title,
    required this.icon,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DebugRowTitle(
            title: title,
            icon: icon,
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: theme.cardBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children
                  .mapIndexed((index, child) {
                    final isLast = index == children.length - 1;
                    return [
                      child,
                      if (!isLast) ...[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          height: 1,
                          color: theme.debugTitleBackground,
                        ),
                      ],
                    ];
                  })
                  .expand((item) => item)
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
