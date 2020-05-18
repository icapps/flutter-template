import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_switch.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';

class DebugRowSwitchItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const DebugRowSwitchItem({
    @required this.title,
    @required this.value,
    @required this.onChanged,
    this.subTitle,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TouchFeedBack(
      onClick: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.all(ThemeDimens.padding16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headline6,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle,
                      style: textTheme.subtitle2,
                    ),
                ],
              ),
            ),
            FlutterTemplateSwitch(
              value: value,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
