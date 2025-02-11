import 'package:flutter/material.dart';
import 'package:flutter_template/widgetbook/widgetbook_widgets/widgetbook_screen.dart';
import 'package:icapps_icons/icapps_icons.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: Icon,
  path: 'widget',
)
Widget icons(BuildContext context) => WidgetBookScreen(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 32),
        itemCount: IcappsIcons.allIcons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Column(
          children: [
            Icon(
              IcappsIcons.allIcons[index],
              size: 48,
            ),
            Text(IcappsIcons.allIcons[index].codePoint.toString()),
          ],
        ),
      ),
    );
