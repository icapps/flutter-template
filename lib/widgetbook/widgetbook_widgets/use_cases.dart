import 'package:flutter/material.dart';
import 'package:flutter_template/widget/library/flutter_template_back_button.dart';
import 'package:flutter_template/widget/library/flutter_template_button.dart';
import 'package:flutter_template/widget/library/flutter_template_checkbox.dart';
import 'package:flutter_template/widget/library/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/library/flutter_template_switch.dart';
import 'package:flutter_template/widgetbook/widgetbook_widgets/widgetbook_screen.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: FlutterTemplateBackButton,
)
Widget backButton(BuildContext context) => WidgetBookScreen(
      child: FlutterTemplateBackButton(
        onClick: () {},
        isLight: context.knobs.boolean(label: 'light', initialValue: false),
        fullScreen: context.knobs.boolean(label: 'fullScreen', initialValue: false),
      ),
    );

@UseCase(
  name: 'Default',
  type: FlutterTemplateButton,
)
Widget button(BuildContext context) => WidgetBookScreen(
      child: FlutterTemplateButton(
        onClick: () {},
        text: context.knobs.string(label: 'text', initialValue: 'Button'),
        isEnabled: context.knobs.boolean(label: 'enabled', initialValue: true),
        isExpanded: context.knobs.boolean(label: 'expanded'),
      ),
    );

@UseCase(
  name: 'Text',
  type: FlutterTemplateButton,
)
Widget textButton(BuildContext context) => WidgetBookScreen(
      child: FlutterTemplateButton(
        onClick: () {},
        text: context.knobs.string(label: 'text', initialValue: 'Button'),
        isEnabled: context.knobs.boolean(label: 'enabled', initialValue: true),
        isExpanded: context.knobs.boolean(label: 'expanded'),
        buttonType: ButtonType.text,
      ),
    );

@UseCase(
  name: 'Default',
  type: FlutterTemplateCheckBox,
)
Widget checkBox(BuildContext context) => WidgetBookScreen(
      child: FlutterTemplateCheckBox(
        value: context.knobs.boolean(label: 'value', initialValue: true),
        onChanged: (value) {},
      ),
    );

@UseCase(
  name: 'Default',
  type: FlutterTemplateProgressIndicator,
)
Widget progressIndicator(BuildContext context) => WidgetBookScreen(
      child: FlutterTemplateProgressIndicator(
        dark: context.knobs.boolean(label: 'dark', initialValue: true),
      ),
    );

@UseCase(
  name: 'Default',
  type: FlutterTemplateSwitch,
)
Widget switchWidget(BuildContext context) => WidgetBookScreen(
      child: FlutterTemplateSwitch(
        value: context.knobs.boolean(label: 'value', initialValue: true),
        onChanged: (value) {},
      ),
    );
