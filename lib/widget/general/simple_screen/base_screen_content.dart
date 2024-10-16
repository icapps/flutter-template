import 'package:flutter/material.dart';

class BaseScreenContent extends StatelessWidget {
  final bool useSlivers;
  final bool isScrollable;
  final bool reversed;
  final int? itemCount;
  final Widget? child;
  final EdgeInsets padding;
  final List<Widget> children;
  final IndexedWidgetBuilder? itemBuilder;

  const BaseScreenContent({
    required this.useSlivers,
    required this.isScrollable,
    required this.padding,
    required this.children,
    required this.itemBuilder,
    required this.itemCount,
    required this.reversed,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget content;

    if (children.isNotEmpty) {
      if (useSlivers) {
        content = CustomScrollView(
          slivers: children,
          reverse: reversed,
        );
      } else if (isScrollable) {
        content = ListView(
          padding: padding,
          reverse: reversed,
          children: children,
        );
      } else {
        content = Padding(
          padding: padding,
          child: Column(
            verticalDirection: reversed ? VerticalDirection.up : VerticalDirection.down,
            children: children,
          ),
        );
      }
    } else if (itemBuilder != null) {
      content = ListView.builder(
        padding: padding,
        itemBuilder: itemBuilder!,
        itemCount: itemCount,
        reverse: reversed,
      );
    } else {
      content = Padding(
        padding: padding,
        child: child,
      );
    }

    return content;
  }
}
