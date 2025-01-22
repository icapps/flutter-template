import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/general/simple_screen/base_screen.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:provider/provider.dart';

@flutterRoute
class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => BaseScreen(
        title: localization.settingsTitle,
        padding: EdgeInsets.zero,
        isScrollable: true,
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
            onClick: viewModel.goToDatabase,
          ),
          DebugRowTitle(title: localization.debugPermissionsTitle),
          DebugRowItem(
            key: Keys.debugPermissionAnalytics,
            title: localization.debugPermissionsShowAnalyticsPermission,
            onClick: viewModel.goToAnalyticsPermissionScreen,
          ),
          DebugRowItem(
            key: Keys.debugPermissionAnalyticsReset,
            title: localization.debugPermissionResetAnalytics,
            onClick: viewModel.resetAnalyticsPermission,
          ),
          const DebugRowTitle(title: 'logs'),
          DebugRowItem(
            key: Keys.debugPermissionAnalyticsReset,
            title: 'Show logs',
            onClick: viewModel.onLogsTapped,
          ),
        ],
      ),
    );
  }
}
