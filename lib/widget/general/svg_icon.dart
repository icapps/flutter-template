import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class SvgIcon extends StatelessWidget {
  final String svgAsset;
  final Color color;
  final double size;

  const SvgIcon({
    @required this.svgAsset,
    this.color = Colors.black,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isInTest()) {
      return FutureBuilder<String>(
        future: _getSvgString(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SvgPicture.string(
              snapshot.data,
              height: size,
              width: size,
              color: color,
            );
          }
          return Container(
            height: size,
            width: size,
          );
        },
      );
    }
    return SvgPicture.asset(
      svgAsset,
      height: size,
      width: size,
      color: color,
    );
  }

  Future<String> _getSvgString() async {
    return rootBundle.loadString(svgAsset);
  }
}
