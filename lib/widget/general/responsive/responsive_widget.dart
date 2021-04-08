import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final WidgetBuilder? tabletBuilder;
  final WidgetBuilder? landscapeBuilder;
  final WidgetBuilder? tabletLandscapeBuilder;
  final Widget Function(BuildContext context, SizeInformation sizeInformation)? builder;

  const ResponsiveWidget({
    this.tabletBuilder,
    this.landscapeBuilder,
    this.tabletLandscapeBuilder,
    this.builder,
    Key? key,
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
      final tabletLandscapeB = tabletLandscapeBuilder;
      final tabletB = tabletBuilder;
      final landscapeB = landscapeBuilder;
      final portraitBuilder = builder;
      if (info.orientation == Orientation.landscape && info.deviceType == DeviceScreenType.Tablet && tabletLandscapeB != null) {
        return tabletLandscapeB(context);
      } else if (info.deviceType == DeviceScreenType.Tablet && tabletB != null) {
        return tabletB(context);
      } else if (info.orientation == Orientation.landscape && landscapeB != null) {
        return landscapeB(context);
      } else if (portraitBuilder != null) {
        return portraitBuilder(context, info);
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
    required this.orientation,
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });
}
