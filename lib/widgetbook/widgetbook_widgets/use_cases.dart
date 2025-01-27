import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'with green color',
  type: Container,
  path: '[widgets]/containers',
)
Widget greenContainerUseCase(BuildContext context) {
  return Container(
    color: Colors.green,
    width: 100,
    height: 100,
  );
}
