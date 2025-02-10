import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withOpacityValue(double opacity) => withValues(alpha: opacity);
}
