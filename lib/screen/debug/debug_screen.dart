import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/responsive/responsive_widget.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:provider/provider.dart';

class DebugScreen extends StatefulWidget {
  static const String routeName = 'debug';

  @override
  _DebugScreenState createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> implements DebugNavigator {
  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return ProviderWidget<DebugViewModel>(
      consumer: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(localization.settingsTitle),
        ),
        body: ResponsiveWidget(
          builder: (context, info) => ListView(
            children: [
              DebugRowTitle(title: localization.debugAnimationsTitle),
              DebugRowSwitchItem(
                title: localization.debugSlowAnimations,
                value: viewModel.slowAnimationsEnabled,
                onChanged: viewModel.onSlowAnimationsChanged,
              ),
              DebugRowTitle(title: localization.debugThemeTitle),
              DebugRowItem(
                title: localization.debugTargetPlatformTitle,
                subTitle: localization.debugTargetPlatformSubtitle(localization.getTranslation(Provider.of<GlobalViewModel>(context).getCurrentPlatform())),
                onClick: viewModel.onTargetPlatformClicked,
              ),
              DebugRowTitle(title: localization.debugLocaleTitle),
              DebugRowItem(
                title: localization.debugLocaleSelector,
                subTitle: localization.debugLocaleCurrentLanguage(Provider.of<GlobalViewModel>(context).getCurrentLanguage()),
                onClick: viewModel.onSelectLanguageClicked,
              ),
              DebugRowSwitchItem(
                title: localization.debugShowTranslations,
                value: Provider.of<GlobalViewModel>(context, listen: false).showsTranslationKeys,
                onChanged: (_) => Provider.of<GlobalViewModel>(context, listen: false).toggleTranslationKeys(),
              ),
              DebugRowTitle(title: localization.debugLicensesTitle),
              DebugRowItem(
                title: localization.debugLicensesGoTo,
                onClick: viewModel.onLicensesClicked,
              ),
            ],
          ),
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }

  @override
  Future<void> goToTargetPlatformSelector() => MainNavigatorWidget.of(context).goToDebugPlatformSelector();

  @override
  void goToLicenses() => MainNavigatorWidget.of(context).goToLicense();

  @override
  void goToSelectLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        final globalViewModel = Provider.of<GlobalViewModel>(context);
        final localization = Localization.of(context);
        return AlertDialog(
          title: Text(localization.debugLocaleSelector),
          content: Container(
            height: 100,
            width: MediaQuery.of(context).size.width / 1.2,
            child: ListView(
              shrinkWrap: true,
              children: [
                SelectorItem(
                  title: 'English',
                  selected: globalViewModel.isLanguageSelected('en'),
                  onClick: () {
                    globalViewModel.onSwitchToEnglish();
                    Navigator.of(context).pop();
                  },
                ),
                SelectorItem(
                  title: 'Nederlands',
                  selected: globalViewModel.isLanguageSelected('nl'),
                  onClick: () {
                    globalViewModel.onSwitchToDutch();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
