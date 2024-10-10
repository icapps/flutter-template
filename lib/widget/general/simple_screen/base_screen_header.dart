import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class BaseScreenHeader extends StatelessWidget {
  final String? title;
  final List<Widget> trailingItems;
  final VoidCallback? onBackTapped;

  const BaseScreenHeader({
    this.onBackTapped,
    this.title,
    this.trailingItems = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        color: theme.colorsTheme.primary,
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false) ...[
                FlutterTemplateBackButton.light(onClick: onBackTapped),
                const SizedBox(width: 24),
              ],
              if (title != null) ...[
                Expanded(
                  child: Text(
                    title!.toUpperCase(),
                    style: theme.inverseCoreTextTheme.bodyNormal,
                  ),
                ),
              ],
              ...trailingItems,
            ],
          ),
        ),
      ),
    );
  }
}
