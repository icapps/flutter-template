import 'package:flutter/material.dart';
import 'package:flutter_template/util/extension/color_extension.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle withOpacity0() => _withOpacity(0);

  TextStyle withOpacity20() => _withOpacity(0.2);

  TextStyle withOpacity40() => _withOpacity(0.4);

  TextStyle withOpacity60() => _withOpacity(0.6); //Light dark

  TextStyle _withOpacity(double opacity) => copyWith(color: color?.withOpacityValue(opacity));
}
