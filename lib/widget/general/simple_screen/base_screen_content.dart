import 'package:flutter/material.dart';

class BaseScreenContent extends StatelessWidget {
  final bool useSlivers;
  final bool isScrollable;
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
        );
      } else if (isScrollable) {
        content = ListView(
          padding: padding,
          children: children,
        );
      } else {
        content = Padding(
          padding: padding,
          child: Column(children: children),
        );
      }
    } else if (itemBuilder != null) {
      content = ListView.builder(
        padding: padding,
        itemBuilder: itemBuilder!,
        itemCount: itemCount,
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
