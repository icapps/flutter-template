import 'package:flutte_template/screen/home/home_screen.dart';
import 'package:flutte_template/screen/splash/splash_screen.dart';
import 'package:flutte_template/widget/general/flavor_banner.dart';
import 'package:flutter/material.dart';

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
    return Navigator(
      key: navigationKey,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return buildRoute<SplashScreen>(screen: SplashScreen(), settings: settings);
      case HomeScreen.routeName:
        return buildRoute<HomeScreen>(screen: HomeScreen(), settings: settings);
      default:
        return null;
    }
  }

  Route buildRoute<T>({@required Widget screen, @required RouteSettings settings}) {
    return MaterialPageRoute(
      builder: (context) => FlavorBanner(
            child: screen,
          ),
      settings: settings,
    );
  }

  void goToSplash() => navigationKey.currentState.pushReplacementNamed(SplashScreen.routeName);

  void goToHome() => navigationKey.currentState.pushReplacementNamed(HomeScreen.routeName);
}
