import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DataProviderWidget extends BaseThemeProviderWidget<FlutterTemplateTheme, Localization> {
  const DataProviderWidget({
    super.key,
    super.childBuilderTheme,
    super.childBuilderLocalization,
    super.childBuilder,
  });
}
