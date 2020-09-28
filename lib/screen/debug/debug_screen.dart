import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/global/global_cubit.dart';
import 'package:flutter_template/bridge/logging/logging_bridging.dart';
import 'package:flutter_template/repository/debug/debug_repository.dart';
import 'package:flutter_template/repository/locale/locale_repository.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigators/main_navigator.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/debug/select_language_dialog.dart';
import 'package:flutter_template/widget/general/responsive/responsive_widget.dart';

class DebugScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      cubit: BlocProvider.of<GlobalCubit>(context),
      builder: (context, state) {
        if (state is InitialGlobalState) {
          return buildContent(context, state: state);
        } else {
          return buildContent(context);
        }
      },
    );
  }

  Widget buildContent(BuildContext context, {GlobalState state}) {
    final localization = Localization.of(context);
    return Scaffold(
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
              value: state?.slowAnimationsEnabled,
              onChanged: (enabled) => context.bloc<GlobalCubit>().changeSlowAnimations(enabled: enabled),
            ),
            DebugRowTitle(title: localization.debugThemeTitle),
            DebugRowItem(
              key: Keys.debugTargetPlatform,
              title: localization.debugTargetPlatformTitle,
              subTitle: localization.debugTargetPlatformSubtitle(localization.getTranslation(DebugRepository.getCurrentPlatform(state?.targetPlatform))),
              onClick: () => goToTargetPlatformSelector(context),
            ),
            DebugRowTitle(title: localization.debugLocaleTitle),
            DebugRowItem(
              key: Keys.debugSelectLanguage,
              title: localization.debugLocaleSelector,
              subTitle: localization.debugLocaleCurrentLanguage(LocaleRepository.getCurrentLanguage(state?.locale?.languageCode)),
              onClick: () => goToSelectLanguage(context),
            ),
            DebugRowSwitchItem(
              key: Keys.debugShowTranslations,
              title: localization.debugShowTranslations,
              value: state.showsTranslationKeys,
              onChanged: (_) => context.bloc<GlobalCubit>().toggleTranslationKeys(),
            ),
            DebugRowTitle(title: localization.debugLicensesTitle),
            DebugRowItem(
              key: Keys.debugLicense,
              title: localization.debugLicensesGoTo,
              onClick: () => goToLicenses(context),
            ),
            DebugRowTitle(
              title: localization.debugNativeBridge,
            ),
            DebugRowItem(
              title: localization.debugNativeBridgeLog,
              onClick: onLogNativeBridge,
            ),
          ],
        ),
      ),
    );
  }

  void onLogNativeBridge() {
    KiwiContainer().resolve<LoggingBridging>().log('TEST From the debug screen.');
  }

  void goToTargetPlatformSelector(BuildContext context) => MainNavigatorWidget.of(context).goToDebugPlatformSelector();

  void goToLicenses(BuildContext context) => MainNavigatorWidget.of(context).goToLicense();

  void goToSelectLanguage(BuildContext context) => MainNavigatorWidget.of(context).showCustomDialog(
        builder: (context) => SelectLanguageDialog(
          goBack: MainNavigatorWidget.of(context).closeDialog,
        ),
      );
}
