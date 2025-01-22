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
    if (itemBuilder != null) {
      return ListView.builder(
        padding: padding,
        itemBuilder: itemBuilder!,
        itemCount: itemCount,
        reverse: reversed,
      );
    }

    if (children.isNotEmpty) {
      if (useSlivers) {
        return CustomScrollView(
          slivers: children,
          reverse: reversed,
        );
      }
      if (isScrollable) {
        return ListView(
          padding: padding,
          reverse: reversed,
          children: children,
        );
      }
      
      return Padding(
        padding: padding,
        child: Column(
          verticalDirection: reversed ? VerticalDirection.up : VerticalDirection.down,
          children: children,
        ),
      );
    }

    return Padding(
      padding: padding,
      child: child,
    );
  }
}
