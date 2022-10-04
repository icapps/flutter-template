import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class ThemeAssets {
  ThemeAssets._();

  static String _getIcon(BuildContext context, String name) {
    if (context.isIOSTheme) {
      return 'assets/images/icons/ios/$name.svg';
    }
    return 'assets/images/icons/android/$name.svg';
  }

  static String listIcon(BuildContext context) => _getIcon(context, 'list');

  static String settingsIcon(BuildContext context) => _getIcon(context, 'settings');

  static String addIcon(BuildContext context) => _getIcon(context, 'add');

  static String downloadIcon(BuildContext context) => _getIcon(context, 'download');

  static String closeIcon(BuildContext context) => _getIcon(context, 'close');

  static String backIcon(BuildContext context) => _getIcon(context, 'back');

  static String doneIcon(BuildContext context) => _getIcon(context, 'done');
}
