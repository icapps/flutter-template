import 'package:flutte_template/styles/theme_dimens.dart';
import 'package:flutte_template/util/locale/localization.dart';
import 'package:flutte_template/viewmodel/home/home_viewmodel.dart';
import 'package:flutte_template/viewmodel/locale/locale_viewmodel.dart';
import 'package:flutte_template/widget/user/user_row.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
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
              icon: Icon(Icons.language),
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
            if (value.loading) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
            if (value.error != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    value.error,
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
            if (!value.loading && value.data.isEmpty) {
              return Center(
                child: Text(Localization.of(context).usersNotFound),
              );
            }
            if (!value.loading && value.data.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                itemCount: value.data.length,
                itemBuilder: (context, index) {
                  final item = value.data[index];
                  return UserRow(
                    title: item.name,
                    titleIcon: Icons.person,
                    subtitle: item.address.street,
                    subtitleIcon: Icons.location_city,
                    onClick: value.onUserClicked,
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
      builder: (context) => kiwi.Container().resolve()..init(this),
    );
  }

  @override
  void goToUserDetail() {
    final snackBar = SnackBar(
      content: Text(Localization.of(context).userClickMessage),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
