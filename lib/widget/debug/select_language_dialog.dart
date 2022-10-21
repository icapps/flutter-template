import 'package:flutter/material.dart';
import 'package:flutter_template/util/extension/localization_extension.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectLanguageDialog({
    required this.goBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final globalViewModel = Provider.of<GlobalViewModel>(context);
    return DataProviderWidget(childBuilderTheme: (context, theme) {
      return AlertDialog(
        backgroundColor: theme.colorsTheme.background,
        title: Text(localization.debugLocaleSelector),
        content: SizedBox(
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
    });
  }
}
