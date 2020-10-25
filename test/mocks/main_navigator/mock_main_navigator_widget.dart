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
  void goBack<T>({T result}) => widget.mock.goBack(result: result);

  @override
  void goToAddTodo() => widget.mock.goToAddTodo();

  @override
  Future<void> goToDebugPlatformSelector() async => widget.mock.goToDebugPlatformSelector();

  @override
  void goToHome() => widget.mock.goToHome();

  @override
  void goToLicense() => widget.mock.goToLicense();

  @override
  void goToLogin() => widget.mock.goToLogin();

  @override
  void goToSplash() => widget.mock.goToSplash();

  @override
  void showCustomDialog<T>({builder}) => widget.mock.showCustomDialog<T>(builder: builder);
}

class MockMainNavigation extends Mock implements MainNavigation {}
