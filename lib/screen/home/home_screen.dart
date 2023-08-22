import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/model/bottom_navigation/bottom_navigation_tab.dart';
import 'package:flutter_template/widget/general/bottom_navigation/bottom_navigation.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var _currentTab = BottomNavigationTab.defaultTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTab.index,
        children: BottomNavigationTab.values.map((tab) => tab.childBuilder(context)).toList(),
      ),
      bottomNavigationBar: DataProviderWidget(
        childBuilder: (context, theme, localization) => BottomNavigation(
          selectedTab: _currentTab,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(BottomNavigationTab tab) => setState(() => _currentTab = tab);
}
