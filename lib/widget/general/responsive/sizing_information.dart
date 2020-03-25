import 'package:flutter/widgets.dart';
import 'package:flutter_template/widget/general/responsive/device_screen_type.dart';

class SizeInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizeInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });
}
