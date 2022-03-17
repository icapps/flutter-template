import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToLogin();

  void goToHome();

  void goToAddTodo();

  void goToDebugPlatformSelector();

  void goToThemeModeSelector();

  void goToDebug();

  void goToLicense();

  void closeDialog();

  void goToDatabase(GeneratedDatabase db);

  void goBack<T>({T? result});

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T> implements MainNavigation {}
