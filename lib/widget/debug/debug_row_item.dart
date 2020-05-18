import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';

class DebugRowItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onClick;

  const DebugRowItem({
    @required this.title,
    @required this.onClick,
    this.subTitle,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TouchFeedBack(
      onClick: onClick,
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
                  if (subTitle != null) ...[
                    Container(height: ThemeDimens.padding4),
                    Text(
                      subTitle,
                      style: textTheme.subtitle2,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
