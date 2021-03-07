import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final T Function() create;
  final Widget? child;
  final Widget Function(BuildContext context, FlutterTemplateTheme theme, Localization localization)? childBuilder;
  final Widget Function(BuildContext context, T viewModel, FlutterTemplateTheme theme, Localization localization)? childBuilderWithViewModel;
  final Widget? consumerChild;
  final Widget Function(BuildContext context, T viewModel, Widget? child)? consumer;
  final Widget Function(BuildContext context, T viewModel, Widget? child, FlutterTemplateTheme theme, Localization localization)? consumerWithThemeAndLocalization;
  final bool lazy;

  const ProviderWidget({
    required this.create,
    this.child,
    this.childBuilder,
    this.consumer,
    this.consumerWithThemeAndLocalization,
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
          final consumer = this.consumer;
          if (consumerWithThemeAndLocalization != null || consumer != null) {
            return Consumer<T>(
              child: consumerChild ?? Container(),
              builder: consumer ?? (context, t, widget) => consumerWithThemeAndLocalization!(context, t, widget, FlutterTemplateTheme.of(context), Localization.of(context)),
            );
          } else if (child != null) {
            return child!;
          } else if (childBuilder != null) {
            return childBuilder!(context, FlutterTemplateTheme.of(context), Localization.of(context));
          } else if (childBuilderWithViewModel != null) {
            return childBuilderWithViewModel!(context, Provider.of<T>(context), FlutterTemplateTheme.of(context), Localization.of(context));
          }
          throw ArgumentError('child, childBuilder, childBuilderWithViewModel, consumer or consumerWithThemeAndLocalization should be passed');
        },
      ),
      create: (context) => create(),
    );
  }
}
