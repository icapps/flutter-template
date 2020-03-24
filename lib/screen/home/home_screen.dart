import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeNavigator {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return ProviderWidget<HomeViewModel>(
      consumer: (context, viewModel, child) => Scaffold(
        body: IndexedStack(
          children: [
            TodoListScreen(),
            DebugScreen(),
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title:  Text(localization.todoTitle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(localization.settingsTitle),
            ),
          ],
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }

  void onTap(int newIndex) {
    setState(() => _currentIndex = newIndex);
  }
}
