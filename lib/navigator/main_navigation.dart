import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToLogin();

  void goToHome();

  void goToAddTodo();

  void goToDebugPlatformSelector();

  void goToLicense();

  void closeDialog();

  void goBack<T>({T result});

  void showCustomDialog<T>({WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T> implements MainNavigation {}
