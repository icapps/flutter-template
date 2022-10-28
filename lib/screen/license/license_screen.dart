import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/general/theme_widget.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class LicenseScreen extends StatefulWidget {
  static const String routeName = RouteNames.licenseScreen;

  const LicenseScreen({super.key});

  @override
  LicenseScreenState createState() => LicenseScreenState();
}

@visibleForTesting
class LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LicenseViewModel>(
      create: getIt,
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => ThemeWidget(
        child: Scaffold(
          backgroundColor: theme.colorsTheme.background,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            leading: FlutterTemplateBackButton.light(onClick: viewModel.onBackClicked),
            title: Text(localization.debugLicensesTitle),
            backgroundColor: theme.colorsTheme.primary,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(ThemeDimens.padding16),
            itemCount: viewModel.licenses.length,
            itemBuilder: (context, index) {
              final item = viewModel.licenses[index];
              return Card(
                color: theme.colorsTheme.background,
                child: Padding(
                  padding: const EdgeInsets.all(ThemeDimens.padding16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: theme.coreTextTheme.titleNormal,
                      ),
                      Container(height: ThemeDimens.padding8),
                      Text(
                        item.license,
                        style: theme.coreTextTheme.bodySmall.copyWith(
                          color: theme.isDarkTheme ? ThemeColors.white50 : ThemeColors.mediumGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
