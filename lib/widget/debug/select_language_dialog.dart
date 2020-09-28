import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectLanguageDialog({@required this.goBack});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      cubit: BlocProvider.of<GlobalCubit>(context),
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        if (state is InitialGlobalState) {
          return buildContent(context, state.locale);
        } else {
          return buildContent(context, null);
        }
      },
    );
  }

  Widget buildContent(BuildContext context, Locale currentLanguage) {
    final localization = Localization.of(context);
    return AlertDialog(
      title: Text(localization.debugLocaleSelector),
      content: Container(
        height: ThemeDimens.selectLanguageDialogHeight,
        width: MediaQuery.of(context).size.width / 1.2,
        child: ListView(
          shrinkWrap: true,
          children: [
            SelectorItem(
              title: localization.generalLabelSystemDefault,
              selected: isLanguageSelected(currentLanguage, null),
              onClick: () {
                context.bloc<GlobalCubit>().changeLanguageToDefault();
                goBack();
              },
            ),
            SelectorItem(
              title: 'English',
              selected: isLanguageSelected(currentLanguage, 'en'),
              onClick: () {
                context.bloc<GlobalCubit>().changeLanguageToEnglish();
                goBack();
              },
            ),
            SelectorItem(
              title: 'Nederlands',
              selected: isLanguageSelected(currentLanguage, 'nl'),
              onClick: () {
                context.bloc<GlobalCubit>().changeLanguageToDutch();
                goBack();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isLanguageSelected(Locale locale, String languageCode) {
    if (locale == null && languageCode == null) return true;
    return locale?.languageCode == languageCode;
  }
}
