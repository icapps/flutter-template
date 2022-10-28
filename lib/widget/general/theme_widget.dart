import 'package:flutter/material.dart';
import 'package:flutter_template/main_common.dart';

class ThemeWidget extends StatefulWidget {
  final Widget child;

  const ThemeWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    if (updateAppTheme()) {
      rebuildAllChildren(context);
    }
    return widget.child;
  }
}
