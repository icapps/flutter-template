import 'package:flutter/material.dart';
import 'package:moor/moor.dart';

abstract class MainNavigation {
  void goToSplash();

  void goToLogin();

  void goToHome();

  void goToAddTodo();

  void goToDebugPlatformSelector();

  void goToLicense();

  void closeDialog();

  void goToDatabase(GeneratedDatabase db);

  void goBack<T>({T? result});

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T> implements MainNavigation {}
