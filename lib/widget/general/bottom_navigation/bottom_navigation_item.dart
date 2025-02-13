import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/extension/text_scaler_extensions.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class BottomNavigationItem extends StatelessWidget {
  final bool isSelected;
  final String labelKey;
  final IconData iconActive;
  final IconData iconInactive;
  final VoidCallback onTap;

  static const _itemHeight = 56.0;

  const BottomNavigationItem({
    required this.isSelected,
    required this.labelKey,
    required this.iconActive,
    required this.iconInactive,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hasSpaceForLabel = MediaQuery.of(context).textScaler.scaleFactor <= 1;
    final child = DataProviderWidget(
      childBuilder: (context, theme, localization) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              duration: ThemeDurations.shortAnimationDuration,
              firstChild: Icon(
                iconActive,
                color: theme.main,
                size: hasSpaceForLabel ? ThemeDimens.iconSize : ThemeDimens.largeIcon,
              ),
              secondChild: Icon(
                iconInactive,
                color: theme.bodyNeutralFaded,
                size: hasSpaceForLabel ? ThemeDimens.iconSize : ThemeDimens.largeIcon,
              ),
              crossFadeState: isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
            if (hasSpaceForLabel) ...[
              const SizedBox(height: 2),
              AnimatedDefaultTextStyle(
                duration: ThemeDurations.shortAnimationDuration,
                style: isSelected ? theme.main.paragraphS.bold : theme.bodyNeutralFaded.paragraphS,
                child: Text(
                  localization.getTranslation(labelKey),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ],
        ),
      ),
    );
    if (context.isIOSTheme) {
      return Expanded(
        child: DataProviderWidget(
          childBuilderLocalization: (context, localization) => Semantics(
            button: true,
            label: 'Bottom navigation item ${localization.getTranslation(labelKey)}',
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.transparent,
                height: _itemHeight,
                child: child,
              ),
            ),
          ),
        ),
      );
    }
    return Expanded(
      child: DataProviderWidget(
        childBuilderLocalization: (context, localization) => LayoutBuilder(
          builder: (context, constraint) => Container(
            height: _itemHeight,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: OverflowBox(
              maxHeight: constraint.maxHeight < _itemHeight * 2 ? _itemHeight * 2 : constraint.maxHeight * 3,
              maxWidth: constraint.maxWidth < _itemHeight * 2 ? _itemHeight * 2 : constraint.maxWidth,
              child: ClipOval(
                child: Semantics(
                  button: true,
                  label: localization.semanticBottomNavigationItem(localization.getTranslation(labelKey)),
                  child: SizedBox(
                    height: 128,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
