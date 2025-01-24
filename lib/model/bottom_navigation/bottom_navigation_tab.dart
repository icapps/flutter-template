import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:icapps_icons/icapps_icons.dart';

enum BottomNavigationTab {
  todo(
    iconActive: IcappsIcons.alarmFilled,
    iconInactive: IcappsIcons.alarm,
    labelKey: LocalizationKeys.todoTitle,
  ),
  settings(
    iconActive: IcappsIcons.cogwheel1Filled,
    iconInactive: IcappsIcons.cogwheel1,
    labelKey: LocalizationKeys.settingsTitle,
  );

  final IconData iconActive;
  final IconData iconInactive;
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
