// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

// ignore_for_file: prefer_function_declarations_over_variables, prefer_final_locals, omit_local_variable_types, prefer_int_literals, avoid_types_on_closure_parameters, avoid_positional_boolean_parameters, prefer_const_constructors, avoid_init_to_null, unnecessary_import, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:flutter_template/widget/library/flutter_template_back_button.dart';
import 'package:flutter_template/widget/library/flutter_template_button.dart';
import 'package:flutter_template/widget/library/flutter_template_checkbox.dart';
import 'package:flutter_template/widget/library/flutter_template_input_field.dart';
import 'package:flutter_template/widget/library/flutter_template_network_image.dart';
import 'package:flutter_template/widget/library/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/library/flutter_template_switch.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'FlutterTemplateBackButton',
  type: FlutterTemplateBackButton,
)
Widget flutterTemplateBackButtonUseCase(BuildContext context) {
  void Function()? onClick = null;

  bool isLight = context.knobs.boolean(label: 'isLight', initialValue: true);

  bool fullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  return Center(
      child: FlutterTemplateBackButton(
    onClick: onClick,
    isLight: isLight,
    fullScreen: fullScreen,
  ));
}

@UseCase(
  name: 'FlutterTemplateBackButton (light)',
  type: FlutterTemplateBackButton,
)
Widget flutterTemplateBackButtonUseCaseLight(BuildContext context) {
  void Function()? onClick = null;

  bool fullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  return Center(
      child: FlutterTemplateBackButton.light(
    onClick: onClick,
    fullScreen: fullScreen,
  ));
}

@UseCase(
  name: 'FlutterTemplateBackButton (dark)',
  type: FlutterTemplateBackButton,
)
Widget flutterTemplateBackButtonUseCaseDark(BuildContext context) {
  void Function()? onClick = null;

  bool fullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  return Center(
      child: FlutterTemplateBackButton.dark(
    onClick: onClick,
    fullScreen: fullScreen,
  ));
}

@UseCase(
  name: 'FlutterTemplateInputField',
  type: FlutterTemplateInputField,
)
Widget flutterTemplateInputFieldUseCase(BuildContext context) {
  String hint = context.knobs.string(label: 'hint', initialValue: '');

  void Function(String) onChanged = (String value) {};

  List<String>? autoFillHints = null;

  bool enabled = context.knobs.boolean(label: 'enabled', initialValue: true);

  String? controllerText = context.knobs
      .stringOrNull(label: 'text (controller)', initialValue: null);

  return Center(
      child: FlutterTemplateInputField(
    hint: hint,
    onChanged: onChanged,
    autoFillHints: autoFillHints,
    enabled: enabled,
    controller: TextEditingController(text: controllerText),
  ));
}

@UseCase(
  name: 'FlutterTemplateCheckBox',
  type: FlutterTemplateCheckBox,
)
Widget flutterTemplateCheckBoxUseCase(BuildContext context) {
  bool value = context.knobs.boolean(label: 'value', initialValue: true);

  void Function(bool) onChanged = (bool value) {};

  return Center(
      child: FlutterTemplateCheckBox(
    value: value,
    onChanged: onChanged,
  ));
}

@UseCase(
  name: 'FlutterTemplateSwitch',
  type: FlutterTemplateSwitch,
)
Widget flutterTemplateSwitchUseCase(BuildContext context) {
  bool value = context.knobs.boolean(label: 'value', initialValue: true);

  void Function(bool) onChanged = (bool value) {};

  return Center(
      child: FlutterTemplateSwitch(
    value: value,
    onChanged: onChanged,
  ));
}

@UseCase(
  name: 'FlutterTemplateProgressIndicator',
  type: FlutterTemplateProgressIndicator,
)
Widget flutterTemplateProgressIndicatorUseCase(BuildContext context) {
  bool dark = context.knobs.boolean(label: 'dark', initialValue: true);

  return Center(child: FlutterTemplateProgressIndicator(dark: dark));
}

@UseCase(
  name: 'FlutterTemplateProgressIndicator (dark)',
  type: FlutterTemplateProgressIndicator,
)
Widget flutterTemplateProgressIndicatorUseCaseDark(BuildContext context) {
  return Center(child: FlutterTemplateProgressIndicator.dark());
}

@UseCase(
  name: 'FlutterTemplateProgressIndicator (light)',
  type: FlutterTemplateProgressIndicator,
)
Widget flutterTemplateProgressIndicatorUseCaseLight(BuildContext context) {
  return Center(child: FlutterTemplateProgressIndicator.light());
}

@UseCase(
  name: 'FlutterTemplateNetworkImage',
  type: FlutterTemplateNetworkImage,
)
Widget flutterTemplateNetworkImageUseCase(BuildContext context) {
  String? url = context.knobs.stringOrNull(label: 'url', initialValue: null);

  String? fallbackUrl =
      context.knobs.stringOrNull(label: 'fallbackUrl', initialValue: null);

  BoxFit fit =
      context.knobs.list(label: 'fit', initialOption: BoxFit.cover, options: [
    BoxFit.fill,
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fitWidth,
    BoxFit.fitHeight,
    BoxFit.none,
    BoxFit.scaleDown
  ]);

  double? height =
      context.knobs.doubleOrNull.input(label: 'height', initialValue: null);

  double? width =
      context.knobs.doubleOrNull.input(label: 'width', initialValue: null);

  int durationDays =
      context.knobs.int.input(label: 'days (duration)', initialValue: 0);

  int durationHours =
      context.knobs.int.input(label: 'hours (duration)', initialValue: 0);

  int durationMinutes =
      context.knobs.int.input(label: 'minutes (duration)', initialValue: 0);

  int durationSeconds =
      context.knobs.int.input(label: 'seconds (duration)', initialValue: 0);

  int durationMilliseconds = context.knobs.int
      .input(label: 'milliseconds (duration)', initialValue: 0);

  int durationMicroseconds = context.knobs.int
      .input(label: 'microseconds (duration)', initialValue: 0);

  return Center(
      child: FlutterTemplateNetworkImage(
    url: url,
    fallbackUrl: fallbackUrl,
    fit: fit,
    height: height,
    width: width,
    duration: Duration(
      days: durationDays,
      hours: durationHours,
      minutes: durationMinutes,
      seconds: durationSeconds,
      milliseconds: durationMilliseconds,
      microseconds: durationMicroseconds,
    ),
  ));
}

@UseCase(
  name: 'FlutterTemplateButton',
  type: FlutterTemplateButton,
)
Widget flutterTemplateButtonUseCase(BuildContext context) {
  String text = context.knobs.string(label: 'text', initialValue: 'Button');

  void Function()? onClick = null;

  bool isExpanded =
      context.knobs.boolean(label: 'isExpanded', initialValue: true);

  bool isEnabled =
      context.knobs.boolean(label: 'isEnabled', initialValue: true);

  ButtonType buttonType = context.knobs.list(
      label: 'buttonType',
      initialOption: ButtonType.regular,
      options: [ButtonType.regular, ButtonType.text]);

  return Center(
      child: FlutterTemplateButton(
    text: text,
    onClick: onClick,
    isExpanded: isExpanded,
    isEnabled: isEnabled,
    buttonType: buttonType,
  ));
}

@UseCase(
  name: 'FlutterTemplateButton (text)',
  type: FlutterTemplateButton,
)
Widget flutterTemplateButtonUseCaseText(BuildContext context) {
  String text = context.knobs.string(label: 'text', initialValue: 'Button');

  void Function()? onClick = null;

  bool isExpanded =
      context.knobs.boolean(label: 'isExpanded', initialValue: false);

  bool isEnabled =
      context.knobs.boolean(label: 'isEnabled', initialValue: true);

  ButtonType buttonType = context.knobs.list(
      label: 'buttonType',
      initialOption: ButtonType.text,
      options: [ButtonType.regular, ButtonType.text]);

  return Center(
      child: FlutterTemplateButton.text(
    text: text,
    onClick: onClick,
    isExpanded: isExpanded,
    isEnabled: isEnabled,
    buttonType: buttonType,
  ));
}
