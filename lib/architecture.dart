import 'package:flutter/widgets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/Localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

L _getLocale<L>(BuildContext context) => Localization as L;

T _getTheme<T>(BuildContext context) => FlutterTemplateTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
