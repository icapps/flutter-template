import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final T Function() create;
  final Widget child;
  final Widget Function(BuildContext context, T viewModel) childBuilderWithViewModel;
  final Widget consumerChild;
  final Widget Function(BuildContext context, T viewModel, Widget child) consumer;
  final bool lazy;

  const ProviderWidget({
    @required this.create,
    this.child,
    this.consumer,
    this.consumerChild,
    this.childBuilderWithViewModel,
    this.lazy = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      lazy: lazy,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (consumer != null) {
            return Consumer<T>(
              child: consumerChild ?? Container(),
              builder: consumer,
            );
          } else if (child != null) {
            return child;
          } else if (childBuilderWithViewModel != null) {
            return childBuilderWithViewModel(context, Provider.of<T>(context));
          }
          throw ArgumentError('childBuilder, childBuilderWithViewModel or consumer should be passed');
        },
      ),
      create: (context) => create(),
    );
  }
}
