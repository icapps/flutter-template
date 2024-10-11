import 'package:flutter/material.dart';

class BaseScreenHeaderSafeArea extends StatelessWidget {
  final Widget child;
  final List<Widget> leading;
  final List<Widget> actions;

  const BaseScreenHeaderSafeArea({
    required this.leading,
    required this.actions,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Opacity(
      opacity: 0,
      child: IgnorePointer(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...leading,
            ...actions,
          ],
        ),
      ),
    );
    return Row(
      children: [
        content,
        Expanded(child: child),
        content,
      ],
    );
  }
}
