import 'package:flutter/material.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@widgetBookWidget
class FlutterTemplateProgressIndicator extends StatelessWidget {
  final bool dark;

  const FlutterTemplateProgressIndicator({
    required this.dark,
    super.key,
  });

  const FlutterTemplateProgressIndicator.dark({super.key}) : dark = true;

  const FlutterTemplateProgressIndicator.light({super.key}) : dark = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        if (FlavorConfig.isInTest()) {
          return Container(
            color: theme.accentThink,
            height: 50,
            width: 50,
            child: const Text(
              'CircularProgressIndicator',
              style: TextStyle(fontSize: 8),
            ),
          );
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(dark ? theme.main : theme.pureWhite),
        );
      },
    );
  }
}
