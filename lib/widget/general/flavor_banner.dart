import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProd()) return child;
    return Stack(
      children: [
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: FlavorConfig.instance.name,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: FlavorConfig.instance.color),
      ),
    );
  }
}
