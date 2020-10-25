import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';

class TextScaleFactor extends StatelessWidget {
  final Widget child;

  const TextScaleFactor({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isInTest()) return child;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: child,
    );
  }
}
