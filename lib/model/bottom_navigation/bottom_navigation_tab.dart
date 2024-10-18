import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/styles/theme_assets.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

enum BottomNavigationTab {
  todo(
    iconActive: ThemeAssets.todoIconActive,
    iconInactive: ThemeAssets.todoIconInactive,
    labelKey: LocalizationKeys.todoTitle,
  ),
  settings(
    iconActive: ThemeAssets.settingsIconActive,
    iconInactive: ThemeAssets.settingsIconInactive,
    labelKey: LocalizationKeys.settingsTitle,
  );

  final String iconActive;
  final String iconInactive;
  final String labelKey;

  const BottomNavigationTab({
    required this.iconActive,
    required this.iconInactive,
    required this.labelKey,
  });

  static BottomNavigationTab get defaultTab => BottomNavigationTab.todo;
}

extension BottomNavigationExtension on BottomNavigationTab {
  Widget childBuilder(BuildContext context) => switch (this) {
        BottomNavigationTab.todo => const TodoListScreen(),
        BottomNavigationTab.settings => const DebugScreen(),
      };
}
