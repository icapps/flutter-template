import 'package:flutte_template/styles/theme_dimens.dart';
import 'package:flutter/material.dart';

class UserRow extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final String subtitle;
  final IconData subtitleIcon;
  final VoidCallback onClick;

  const UserRow({@required this.title, @required this.titleIcon, @required this.subtitle, @required this.subtitleIcon, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
        onTap: onClick,
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
