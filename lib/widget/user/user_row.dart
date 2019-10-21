import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/touch_feedback/touch_feedback.dart';

class UserRow extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final String subtitle;
  final IconData subtitleIcon;
  final VoidCallback onClick;

  const UserRow({@required this.title, @required this.titleIcon, @required this.subtitle, @required this.subtitleIcon, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ThemeDimens.padding8),
      child: TouchFeedBack(
        color: ThemeColors.userRowBackground,
        borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
        onClick: onClick,
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(titleIcon),
                  Text(title),
                ],
              ),
              Row(
                children: [
                  Icon(subtitleIcon),
                  Text(subtitle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
