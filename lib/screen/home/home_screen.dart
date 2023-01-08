import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flutter_template/navigator/middle_ware/authentication_guard.dart';
import 'package:flutter_template/screen/debug/debug_screen.dart';
import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_template/util/extension/localization_extension.dart';
import 'package:flutter_template/widget/general/theme_widget.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:get_x_navigation_generator_interface/get_x_navigation_generator_interface.dart';

@GetXRoute(
  navigationType: NavigationType.popAllAndPush,
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
  ],
)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            TodoListScreen(),
            DebugScreen(),
          ],
        ),
        bottomNavigationBar: DataProviderWidget(
          childBuilderTheme: (context, theme) => BottomNavigationBar(
            onTap: _onTap,
            currentIndex: _currentIndex,
            backgroundColor: theme.colorsTheme.bottomNavbarBackground,
            selectedItemColor: theme.colorsTheme.bottomNavbarItemActive,
            unselectedItemColor: theme.colorsTheme.bottomNavbarItemInactive,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: localization.todoTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: localization.settingsTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(int newIndex) {
    setState(() => _currentIndex = newIndex);
  }
}
