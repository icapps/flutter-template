import 'package:flutter/material.dart';
import 'package:flutter_template/model/bottom_navigation/bottom_navigation_tab.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/general/bottom_navigation/bottom_navigation_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class BottomNavigation extends StatelessWidget {
  final BottomNavigationTab selectedTab;
  final ValueChanged<BottomNavigationTab> onItemTapped;

  const BottomNavigation({
    required this.selectedTab,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: theme.pureWhite,
          boxShadow: theme.pureBlack.bottomNavShadow,
        ),
        child: ClipRect(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                top: false,
                child: Row(
                  children: BottomNavigationTab.values
                      .map((tab) => BottomNavigationItem(
                            isSelected: selectedTab == tab,
                            iconActive: tab.iconActive,
                            iconInactive: tab.iconInactive,
                            labelKey: tab.labelKey,
                            onTap: () => onItemTapped(tab),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
