import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widet.dart';
import 'package:flutter_template/widget/user/user_row.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeNavigator {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeViewModel>(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(Localization.of(context).appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                Localizations.localeOf(context).languageCode == 'en'
                    ? Provider.of<GlobalViewModel>(context, listen: false).onSwitchToDutch()
                    : Provider.of<GlobalViewModel>(context, listen: false).onSwitchToEnglish();
              },
            ),
            IconButton(
              icon: const Icon(Icons.description),
              onPressed: MainNavigatorWidget.of(context).goToLicense,
            ),
            IconButton(
              icon: const Icon(Icons.developer_mode),
              onPressed: MainNavigatorWidget.of(context).goToDebug,
            ),
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.showLoading()) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (viewModel.showError()) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    viewModel.getError(),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: ThemeDimens.padding8),
                    child: RaisedButton(
                      child: Text(Localization.of(context).retryBtn),
                      onPressed: viewModel.onRetry,
                    ),
                  )
                ],
              );
            }
            if (viewModel.showNoUsersFound()) {
              return Center(
                child: Text(Localization.of(context).usersNotFound),
              );
            }
            if (viewModel.showUserList()) {
              return ListView.builder(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                itemCount: viewModel.getUserLength(),
                itemBuilder: (context, index) {
                  return UserRow(
                    title: viewModel.getNameAtIndex(index),
                    titleIcon: Icons.person,
                    subtitle: viewModel.getCityAtIndex(index),
                    subtitleIcon: Icons.location_city,
                    onClick: () => viewModel.onUserClicked(index),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }

  @override
  void goToUserDetail(String name) {
    final snackBar = SnackBar(
      content: Text(Localization.of(context).userClickMessage(name)),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
