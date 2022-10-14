import 'package:flutter/material.dart';

enum SnackBarStyle {
  neutral,
  success,
  error,
}

@immutable
class SnackBarStyleData {
  final Color textColor;
  final Color backgroundColor;

  const SnackBarStyleData({
    required this.textColor,
    required this.backgroundColor,
  });
}
