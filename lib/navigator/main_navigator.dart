import 'package:flutter_template/navigator/main_navigation.dart';
import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
import 'package:flutter_template/styles/theme_colors.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/util/route/fade_in_route.dart';
import 'package:flutter_template/widget/general/text_scale_factor.dart';

class MainNavigatorWidget extends StatefulWidget {
  const MainNavigatorWidget({
    Key key,
  }) : super(key: key);

  @override
  MainNavigatorWidgetState createState() => MainNavigatorWidgetState();

  static MainNavigationMixin of(BuildContext context, {bool rootNavigator = false, bool nullOk = false}) {
    final navigator = rootNavigator ? context.findRootAncestorStateOfType<MainNavigationMixin>() : context.findAncestorStateOfType<MainNavigationMixin>();
    assert(() {
      if (navigator == null && !nullOk) {
        throw FlutterError('MainNavigation operation requested with a context that does not include a MainNavigation.\n'
            'The context used to push or pop routes from the MainNavigation must be that of a '
            'widget that is a descendant of a MainNavigatorWidget widget.');
      }
      return true;
    }());
    return navigator;
  }
}

class MainNavigatorWidgetState extends State<MainNavigatorWidget> with MainNavigationMixin {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return TextScaleFactor(
      child: WillPopScope(
        onWillPop: _willPop,
        child: Navigator(
          key: navigationKey,
          initialRoute: FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName,
          onGenerateRoute: _onGenerateRoute,
          observers: [
            HeroController(createRectTween: _createRectTween),
          ],
        ),
      ),
    );
  }

  RectTween _createRectTween(Rect begin, Rect end) => MaterialRectArcTween(begin: begin, end: end);

  Route _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: SplashScreen()), settings: settings);
      case LoginScreen.routeName:
        return FadeInRoute<void>(child: const FlavorBanner(child: LoginScreen()), settings: settings);
      case HomeScreen.routeName:
        return FadeInRoute<void>(child: FlavorBanner(child: HomeScreen()), settings: settings);
      case TodoAddScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: TodoAddScreen()), settings: settings);
      case DebugPlatformSelectorScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: DebugPlatformSelectorScreen()), settings: settings);
      case LicenseScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: LicenseScreen()), settings: settings);
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return MaterialPageRoute<void>(builder: (context) => FlavorBanner(child: Container(color: ThemeColors.grey)), settings: settings);
      default:
        return null;
    }
  }

  Future<bool> _willPop() async => !await navigationKey.currentState.maybePop();

  @override
  void goToSplash() => navigationKey.currentState.pushReplacementNamed(SplashScreen.routeName);

  @override
  void goToLogin() => navigationKey.currentState.pushReplacementNamed(LoginScreen.routeName);

  @override
  void goToHome() => navigationKey.currentState.pushReplacementNamed(HomeScreen.routeName);

  @override
  void goToAddTodo() => navigationKey.currentState.pushNamed(TodoAddScreen.routeName);

  @override
  void goToDebugPlatformSelector() => navigationKey.currentState.pushNamed(DebugPlatformSelectorScreen.routeName);

  @override
  void goToLicense() => navigationKey.currentState.pushNamed(LicenseScreen.routeName);

  @override
  void closeDialog() => Navigator.of(context, rootNavigator: true).pop();

  @override
  void goBack<T>({T result}) => navigationKey.currentState.pop(result);

  @override
  void showCustomDialog<T>({WidgetBuilder builder}) => showDialog<T>(context: navigationKey.currentContext, builder: builder);
}
