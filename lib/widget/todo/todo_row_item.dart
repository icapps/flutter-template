import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_checkbox.dart';

class TodoRowItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const TodoRowItem({
    @required this.title,
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeDimens.padding16,
          vertical: ThemeDimens.padding8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            FlutterTemplateCheckBox(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
