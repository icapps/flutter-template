import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final T Function() create;
  final Widget child;
  final Widget Function(BuildContext context, T viewModel) childBuilderWithViewModel;
  final Widget consumerChild;
  final Widget Function(BuildContext context, T viewModel, Widget child) consumer;

  const ProviderWidget({
    @required this.create,
    this.child,
    this.consumer,
    this.consumerChild,
    this.childBuilderWithViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (child != null) {
            return child;
          } else if (childBuilderWithViewModel != null) {
            return childBuilderWithViewModel(context, Provider.of<T>(context));
          } else if (consumer != null) {
            return Consumer<T>(
              child: consumerChild ?? Container(),
              builder: consumer,
            );
          }
          throw ArgumentError('childBuilder, childBuilderWithViewModel or consumer should be passed');
        },
      ),
      create: (context) => create(),
    );
  }
}
