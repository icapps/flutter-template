import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/util/extension/text_scaler_extensions.dart';
import 'package:flutter_template/widget/animation/animated_color_filter.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class BottomNavigationItem extends StatelessWidget {
  final bool isSelected;
  final String labelKey;
  final IconData icon;
  final VoidCallback onTap;

  static const _itemHeight = 56.0;

  const BottomNavigationItem({
    required this.isSelected,
    required this.labelKey,
    required this.icon,
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
            AnimatedColorFilter(
              color: isSelected ? theme.colorsTheme.bottomNavbarItemActive : theme.colorsTheme.bottomNavbarItemInactive,
              builder: (context, color) => Icon(
                icon,
                color: color,
                size: hasSpaceForLabel ? ThemeDimens.iconSize : ThemeDimens.largeIcon,
              ),
            ),
            if (hasSpaceForLabel) ...[
              const SizedBox(height: 2),
              AnimatedDefaultTextStyle(
                duration: ThemeDurations.shortAnimationDuration,
                style: isSelected
                    ? theme.coreTextTheme.bodySmall.copyWith(color: theme.colorsTheme.bottomNavbarItemActive)
                    : theme.coreTextTheme.bodySmall.copyWith(color: theme.colorsTheme.bottomNavbarItemInactive),
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
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            height: _itemHeight,
            child: child,
          ),
        ),
      );
    }
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          height: _itemHeight,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: OverflowBox(
            maxHeight: constraint.maxHeight < _itemHeight * 2 ? _itemHeight * 2 : constraint.maxHeight * 3,
            maxWidth: constraint.maxWidth < _itemHeight * 2 ? _itemHeight * 2 : constraint.maxWidth,
            child: ClipOval(
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
    );
  }
}
