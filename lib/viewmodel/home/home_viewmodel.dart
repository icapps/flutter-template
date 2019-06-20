import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/user/user.dart';
import 'package:flutter_template/repository/user_repository.dart';

class HomeViewModel with ChangeNotifier {
  final UserRepository _userRepo;

  HomeNavigator _navigator;

  CancelToken _getUsersCancelToken;

  bool _loading = false;

  String _error;

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
      _getUsersCancelToken?.cancel();
      _getUsersCancelToken = CancelToken();
      final newData = await _userRepo.getUsers(_getUsersCancelToken);
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

  void onUserClicked(int index) {
    _navigator.goToUserDetail(_data[index].name);
  }

  void onRetry() {
    getUsers();
  }

  int getUserLength() {
    return _data.length;
  }

  bool showLoading() {
    return _loading;
  }

  bool showError() {
    return _error != null;
  }

  String getError() {
    return _error;
  }

  bool showNoUsersFound() {
    return !_loading && _data.isEmpty;
  }

  bool showUserList() {
    return !_loading && _data.isNotEmpty;
  }

  String getCityAtIndex(int index) {
    return _data[index].address.city;
  }

  String getNameAtIndex(int index) {
    return _data[index].name;
  }

  @override
  void dispose() {
    _getUsersCancelToken?.cancel();
    super.dispose();
  }
}

// ignore: one_member_abstracts
abstract class HomeNavigator {
  void goToUserDetail(String name);
}
