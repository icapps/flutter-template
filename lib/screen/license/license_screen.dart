import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';

class LicenseScreen extends StatefulWidget {
  static const String routeName = 'license';

  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> with BackNavigatorMixin implements LicenseNavigator {
  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return ProviderWidget<LicenseViewModel>(
      consumer: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(localization.debugLicensesTitle),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          itemCount: LicenseUtil.getLicenses().length,
          itemBuilder: (context, index) {
            final item = LicenseUtil.getLicenses()[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Container(height: ThemeDimens.padding8),
                    Text(
                      item.license,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }
}
