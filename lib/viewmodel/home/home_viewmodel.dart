import 'package:dio/dio.dart';
import 'package:flutte_template/model/user/user.dart';
import 'package:flutte_template/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final UserRepository _userRepo;

  HomeNavigator _navigator;

  bool get loading => _loading;
  bool _loading = false;

  String get error => _error;
  String _error;

  List<User> get data => _data;
  final List<User> _data = List();

  HomeViewModel(this._userRepo);

  void init(HomeNavigator navigator) {
    _navigator = navigator;
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      _error = null;
      _loading = true;
      notifyListeners();
      final newData = await _userRepo.getUsers();
      _data
        ..clear()
        ..addAll(newData);
    } on DioError catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void onUserClicked() {
    _navigator.goToUserDetail();
  }

  void onRetry() {
    getUsers();
  }
}

// ignore: one_member_abstracts
abstract class HomeNavigator {
  void goToUserDetail();
}
