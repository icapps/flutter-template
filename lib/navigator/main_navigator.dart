import 'package:flutter/material.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/util/route/fade_in_route.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';

class MainNavigatorWidget extends StatefulWidget {
  const MainNavigatorWidget({Key key}) : super(key: key);

  @override
  MainNavigatorWidgetState createState() => MainNavigatorWidgetState();

  static MainNavigatorWidgetState of(context, {rootNavigator = false, nullOk = false}) {
    final MainNavigatorWidgetState navigator = rootNavigator
        ? context.rootAncestorStateOfType(
            const TypeMatcher<MainNavigatorWidgetState>(),
          )
        : context.ancestorStateOfType(
            const TypeMatcher<MainNavigatorWidgetState>(),
          );
    assert(() {
      if (navigator == null && !nullOk) {
        throw FlutterError('MainNavigatorWidget operation requested with a context that does not include a MainNavigatorWidget.\n'
            'The context used to push or pop routes from the MainNavigatorWidget must be that of a '
            'widget that is a descendant of a MainNavigatorWidget widget.');
      }
      return true;
    }());
    return navigator;
  }
}

class MainNavigatorWidgetState extends State<MainNavigatorWidget> {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Navigator(
        key: navigationKey,
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => FlavorBanner(child: SplashScreen()), settings: settings);
      case HomeScreen.routeName:
        return FadeInRoute(child: FlavorBanner(child: HomeScreen()));
      default:
        return null;
    }
  }

  Future<bool> _willPop() async => !await navigationKey.currentState.maybePop();

  void goToSplash() => navigationKey.currentState.pushReplacementNamed(SplashScreen.routeName);

  void goToHome() => navigationKey.currentState.pushReplacementNamed(HomeScreen.routeName);

  void closeDialog() => Navigator.of(context, rootNavigator: true).pop();

  void goBack<T>({result}) => navigationKey.currentState.pop(result);
}
