import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/license.dart';
import 'package:flutter_template/viewmodel/license/license_viewmodel.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LicenseScreen extends StatelessWidget implements LicenseNavigator {
  static const String routeName = 'license';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LicenseViewModel>(
      child: Consumer<LicenseViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text('License'),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(ThemeDimens.padding16),
            itemCount: LicenseUtil.getLicenses().length,
            itemBuilder: (contex, index) {
              final item = LicenseUtil.getLicenses()[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(ThemeDimens.padding16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: TextStyle(color: Colors.black, fontSize: 22),
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
      ),
      create: (context) => KiwiContainer.resolve()..init(this),
    );
  }
}
