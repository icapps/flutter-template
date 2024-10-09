import 'package:flutter/widgets.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class ProviderWidget<T extends ChangeNotifier> extends BaseProviderWidget<T, FlutterTemplateTheme, Localization> {
  const ProviderWidget({
    required super.create,
    super.child,
    super.childBuilder,
    super.childBuilderWithViewModel,
    super.consumerChild,
    super.consumer,
    super.consumerWithThemeAndLocalization,
    super.lazy,
    super.key,
  });
}
