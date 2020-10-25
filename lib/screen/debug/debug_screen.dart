import 'package:kiwi/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_template/widget/general/responsive/responsive_widget.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:provider/provider.dart';

class DebugScreen extends StatefulWidget {
  static const String routeName = 'debug';

  const DebugScreen({
    Key key,
  }) : super(key: key);

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> implements DebugNavigator {
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
                key: Keys.debugSlowAnimations,
                title: localization.debugSlowAnimations,
                value: viewModel.slowAnimationsEnabled,
                onChanged: viewModel.onSlowAnimationsChanged,
              ),
              DebugRowTitle(title: localization.debugThemeTitle),
              DebugRowItem(
                key: Keys.debugTargetPlatform,
                title: localization.debugTargetPlatformTitle,
                subTitle: localization.debugTargetPlatformSubtitle(localization.getTranslation(Provider.of<GlobalViewModel>(context).getCurrentPlatform())),
                onClick: viewModel.onTargetPlatformClicked,
              ),
              DebugRowTitle(title: localization.debugLocaleTitle),
              DebugRowItem(
                key: Keys.debugSelectLanguage,
                title: localization.debugLocaleSelector,
                subTitle: localization.debugLocaleCurrentLanguage(Provider.of<GlobalViewModel>(context).getCurrentLanguage()),
                onClick: viewModel.onSelectLanguageClicked,
              ),
              DebugRowSwitchItem(
                key: Keys.debugShowTranslations,
                title: localization.debugShowTranslations,
                value: Provider.of<GlobalViewModel>(context, listen: false).showsTranslationKeys,
                onChanged: (_) => Provider.of<GlobalViewModel>(context, listen: false).toggleTranslationKeys(),
              ),
              DebugRowTitle(title: localization.debugLicensesTitle),
              DebugRowItem(
                key: Keys.debugLicense,
                title: localization.debugLicensesGoTo,
                onClick: viewModel.onLicensesClicked,
              ),
              DebugRowTitle(
                title: localization.debugNativeBridge,
              ),
              DebugRowItem(
                title: localization.debugNativeBridgeLog,
                onClick: viewModel.onLogNativeBridge,
              ),
            ],
          ),
        ),
      ),
      create: () => KiwiContainer().resolve()..init(this),
    );
  }

  @override
  void goToTargetPlatformSelector() => MainNavigatorWidget.of(context).goToDebugPlatformSelector();

  @override
  void goToLicenses() => MainNavigatorWidget.of(context).goToLicense();

  @override
  void goToSelectLanguage() => MainNavigatorWidget.of(context).showCustomDialog<void>(
        builder: (context) => SelectLanguageDialog(
          goBack: () => MainNavigatorWidget.of(this.context).closeDialog(),
        ),
      );
}
