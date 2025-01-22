import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/platform/platform_util.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen_header_safe_area.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class BaseScreenHeader extends StatelessWidget {
  final bool? centerTitle;
  final String? title;
  final List<Widget> trailingItems;
  final VoidCallback? onBackTapped;

  const BaseScreenHeader({
    this.onBackTapped,
    this.centerTitle,
    this.title,
    this.trailingItems = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        final leading = [
          if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false) ...[
            FlutterTemplateBackButton.light(onClick: onBackTapped ?? Navigator.of(context).pop),
            const SizedBox(width: 24),
          ],
        ];
        final isTitleCentered = centerTitle ?? PlatformUtil.isIOS;
        final titleWidget = title == null
            ? null
            : Text(
                title!.toUpperCase(),
                style: theme.inverseText.bodyNormal,
                textAlign: isTitleCentered ? TextAlign.center : TextAlign.start,
              );

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          color: theme.primary,
          child: SafeArea(
            bottom: false,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    ...leading,
                    if (titleWidget != null && !isTitleCentered) ...[
                      Expanded(
                        child: titleWidget,
                      ),
                    ] else ...[
                      const Spacer(),
                    ],
                    ...trailingItems,
                  ],
                ),
                if (isTitleCentered && titleWidget != null) ...[
                  BaseScreenHeaderSafeArea(
                    leading: leading,
                    actions: trailingItems,
                    child: titleWidget,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
