import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:provider/provider.dart';

class DebugScreen extends StatefulWidget {
  static const String routeName = RouteNames.debugScreen;

  const DebugScreen({
    Key? key,
  }) : super(key: key);

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> implements DebugNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugViewModel>(
      consumerWithThemeAndLocalization: (context, viewModel, child, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
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
              DebugRowItem(
                key: Keys.debugThemeMode,
                title: localization.debugThemeModeTitle,
                subTitle: localization.debugThemeModeSubtitle,
                onClick: viewModel.onThemeModeClicked,
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
              DebugRowTitle(title: localization.debugDatabase),
              DebugRowItem(
                key: Keys.debugDatabase,
                title: localization.debugViewDatabase,
                onClick: goToDatabase,
              ),
            ],
          ),
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }

  @override
  void goToTargetPlatformSelector() => MainNavigatorWidget.of(context).goToDebugPlatformSelector();

  @override
  void goToThemeModeSelector() => MainNavigatorWidget.of(context).goToThemeModeSelector();

  @override
  void goToLicenses() => MainNavigatorWidget.of(context).goToLicense();

  @override
  void goToSelectLanguage() => MainNavigatorWidget.of(context).showCustomDialog<void>(
        builder: (context) => SelectLanguageDialog(
          goBack: () => MainNavigatorWidget.of(context).closeDialog(),
        ),
      );

  void goToDatabase() {
    final db = GetIt.I<FlutterTemplateDatabase>();
    MainNavigatorWidget.of(context).goToDatabase(db);
  }
}
