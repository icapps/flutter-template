import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/localization.dart';

class DataProviderWidget extends StatelessWidget {
  final Widget Function(BuildContext context, FlutterTemplateTheme theme)? childBuilderTheme;
  final Widget Function(BuildContext context, Localization localization)? childBuilderLocalization;
  final Widget Function(BuildContext context, FlutterTemplateTheme theme, Localization localization)? childBuilder;

  const DataProviderWidget({
    this.childBuilderTheme,
    this.childBuilderLocalization,
    this.childBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (childBuilderTheme != null) {
        return childBuilderTheme!(context, FlutterTemplateTheme.of(context));
      } else if (childBuilderLocalization != null) {
        return childBuilderLocalization!(context, Localization.of(context));
      } else if (childBuilder != null) {
        return childBuilder!(context, FlutterTemplateTheme.of(context), Localization.of(context));
      }
      throw ArgumentError('childBuilderTheme, childBuilderLocalization or childBuilder should be passed');
    });
  }
}
