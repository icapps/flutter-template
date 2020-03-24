import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  // ignore: unused_field
  HomeNavigator _navigator;

  HomeViewModel();

  Future<void> init(HomeNavigator navigator) async {
    _navigator = navigator;
  }
}

abstract class HomeNavigator {}
