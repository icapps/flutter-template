import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/license/license_cubit.dart';
import 'package:flutter_template/navigators/back_navigator.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter/material.dart';

class LicenseScreen extends StatelessWidget with BackNavigatorMixin, BackNavigator {
  static const String routeName = 'license';

  const LicenseScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LicenseCubit()..loadLicenses(),
      child: BlocBuilder<LicenseCubit, LicenseState>(
        builder: (context, state) {
          if (state is InitialLicenseState) {
            return buildContent(context, state: state);
          } else {
            return buildContent(context);
          }
        },
      ),
    );
  }

  Widget buildContent(BuildContext context, {InitialLicenseState state}) {
    final localization = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: FlutterTemplateBackButton.light(onClick: () => goBack(context)),
        title: Text(localization.debugLicensesTitle),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(ThemeDimens.padding16),
        itemCount: state?.licenses?.length,
        itemBuilder: (context, index) {
          final item = state?.licenses[index];
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
    );
  }
}
