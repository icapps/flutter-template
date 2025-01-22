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
    // single child
    if (itemBuilder != null) {
      return ListView.builder(
        padding: padding,
        itemBuilder: itemBuilder!,
        itemCount: itemCount,
      );
    }
    
    // multiple children
    if (children.isNotEmpty) {
      if (useSlivers) {
        return CustomScrollView(slivers: children);
      }
      if (isScrollable) {
        return ListView(
          padding: padding,
          children: children,
        );
      }
      return Padding(
        padding: padding,
        child: Column(children: children),
      );
    }

    return Padding(
      padding: padding,
      child: child,
    );
  }
}
