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
    print('Also building!');
    return LayoutBuilder(builder: (context, constraints) {
      if (childBuilderTheme != null) {
        print('Building child with theme!');
        try {
          final c = childBuilderTheme!(context, FlutterTemplateTheme.of(context));
          print('Build complete!');
          return c;
        }catch(e){
          print(e);
        }
      } else if (childBuilderLocalization != null) {
        print('Building child with locale!');
        return childBuilderLocalization!(context, Localization.of(context));
      } else if (childBuilder != null) {
        print('Building child!');
        return childBuilder!(context, FlutterTemplateTheme.of(context), Localization.of(context));
      }
      throw ArgumentError('childBuilderTheme, childBuilderLocalization or childBuilder should be passed');
    });
  }
}
