import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final WidgetBuilder tabletBuilder;
  final WidgetBuilder landscapeBuilder;
  final WidgetBuilder tabletLandscapeBuilder;
  final Widget Function(BuildContext context, SizeInformation sizeInformation) builder;

  const ResponsiveWidget({
    this.tabletBuilder,
    this.landscapeBuilder,
    this.tabletLandscapeBuilder,
    this.builder,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing) {
      final info = SizeInformation(
        orientation: mediaQuery.orientation,
        deviceType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
      );
      if (info.orientation == Orientation.landscape && info.deviceType == DeviceScreenType.Tablet && tabletLandscapeBuilder != null) {
        return tabletLandscapeBuilder(context);
      } else if (info.deviceType == DeviceScreenType.Tablet && tabletBuilder != null) {
        return tabletBuilder(context);
      } else if (info.orientation == Orientation.landscape && landscapeBuilder != null) {
        return landscapeBuilder(context);
      } else if (builder != null) {
        return builder(context, info);
      }
      throw Exception('Failed to build Responsive Widget');
    });
  }

  DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    final orientation = mediaQuery.orientation;
    var deviceWidth = 0.0;
    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }
    if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    }
    return DeviceScreenType.Mobile;
  }
}

enum DeviceScreenType {
  Mobile,
  Tablet,
}

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
