import 'package:flutter/material.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectLanguageDialog({@required this.goBack});

  @override
  Widget build(BuildContext context) {
    final globalViewModel = Provider.of<GlobalViewModel>(context);
    final localization = Localization.of(context);
    return AlertDialog(
      title: Text(localization.debugLocaleSelector),
      content: Container(
        height: 150,
        width: MediaQuery.of(context).size.width / 1.2,
        child: ListView(
          shrinkWrap: true,
          children: [
            SelectorItem(
              title: localization.generalLabelSystemDefault,
              selected: globalViewModel.isLanguageSelected(null),
              onClick: () {
                globalViewModel.onSwitchToSystemLanguage();
                goBack();
              },
            ),
            SelectorItem(
              title: 'English',
              selected: globalViewModel.isLanguageSelected('en'),
              onClick: () {
                globalViewModel.onSwitchToEnglish();
                goBack();
              },
            ),
            SelectorItem(
              title: 'Nederlands',
              selected: globalViewModel.isLanguageSelected('nl'),
              onClick: () {
                globalViewModel.onSwitchToDutch();
                goBack();
              },
            ),
          ],
        ),
      ),
    );
  }
}
