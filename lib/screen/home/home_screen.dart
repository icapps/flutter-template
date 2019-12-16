import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/styles/theme_dimens.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_template/viewmodel/locale/locale_viewmodel.dart';
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
    return ChangeNotifierProvider<HomeViewModel>(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(Localization.of(context).appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                Localizations.localeOf(context).languageCode == 'en'
                    ? Provider.of<LocaleViewModel>(context).onSwitchToDutch()
                    : Provider.of<LocaleViewModel>(context).onSwitchToEnglish();
              },
            )
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            if (value.showLoading()) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.showError()) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    value.getError(),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: ThemeDimens.padding8),
                    child: RaisedButton(
                      child: Text(Localization.of(context).retryBtn),
                      onPressed: value.onRetry,
                    ),
                  )
                ],
              );
            }
            if (value.showNoUsersFound()) {
              return Center(
                child: Text(Localization.of(context).usersNotFound),
              );
            }
            if (value.showUserList()) {
              return ListView.builder(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                itemCount: value.getUserLength(),
                itemBuilder: (context, index) {
                  return UserRow(
                    title: value.getNameAtIndex(index),
                    titleIcon: Icons.person,
                    subtitle: value.getCityAtIndex(index),
                    subtitleIcon: Icons.location_city,
                    onClick: () => value.onUserClicked(index),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
      builder: (context) => KiwiContainer.resolve()..init(this),
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
