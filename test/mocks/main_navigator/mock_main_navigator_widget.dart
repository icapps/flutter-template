import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigation.dart';
import 'package:mockito/mockito.dart';

class MockMainNavigator extends StatefulWidget {
  final Widget child;
  final MockMainNavigation mock;

  const MockMainNavigator({
    @required this.child,
    @required this.mock,
  });

  @override
  _MockMainNavigatorState createState() => _MockMainNavigatorState();
}

class _MockMainNavigatorState extends State<MockMainNavigator> with MainNavigationMixin {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void closeDialog() => widget.mock.closeDialog();

  @override
  void goBack<T>({T result}) {
    // TODO: implement goBack
  }

  @override
  Future<void> goToAddTodo() async {
    // TODO: implement goToAddTodo
  }

  @override
  Future<void> goToDebugPlatformSelector() async {
    await widget.mock.goToDebugPlatformSelector();
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
  }

  @override
  void goToLicense() {
    // TODO: implement goToLicense
  }

  @override
  void goToLogin() {
    // TODO: implement goToLogin
  }

  @override
  void goToSplash() {
    // TODO: implement goToSplash
  }
}

class MockMainNavigation extends Mock implements MainNavigation {}
