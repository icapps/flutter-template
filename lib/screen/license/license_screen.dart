import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  LicenseScreenState createState() => LicenseScreenState();
}

@visibleForTesting
class LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LicenseViewModel>(
      create: getIt.call,
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => BaseScreen.builder(
        title: localization.debugLicensesTitle,
        itemCount: viewModel.licenses.length,
        itemBuilder: (context, index) {
          final item = viewModel.licenses[index];
          return Card(
            color: theme.colorsTheme.background,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: theme.coreTextTheme.titleNormal,
                  ),
                  Container(height: 8),
                  Text(
                    item.license,
                    style: theme.coreTextTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
