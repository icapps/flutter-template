import 'package:flutter/material.dart';
import 'package:flutter_template/navigators/main_navigator.dart';

// ignore: one_member_abstracts
abstract class BackNavigator {
  void goBack<T>(BuildContext context, {T result});
}

mixin BackNavigatorMixin implements BackNavigator {
  @override
  void goBack<E>(BuildContext context, {E result}) => MainNavigatorWidget.of(context).goBack<E>(result: result);
}
