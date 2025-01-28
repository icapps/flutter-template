import 'package:flutter/material.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/widget/general/action/action_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_icons/icapps_icons.dart';

class FlutterTemplateBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const FlutterTemplateBackButton.light({
    required this.onClick,
    this.fullScreen = false,
    super.key,
  }) : isLight = true;

  const FlutterTemplateBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
    super.key,
  }) : isLight = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        icon: getCorrectIcon(context),
        color: isLight ? theme.pureWhite : theme.main,
        onClick: onClick,
      ),
    );
  }

  IconData getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return IcappsIcons.arrowLeft;
    }
    return IcappsIcons.arrowLeft;
  }
}
