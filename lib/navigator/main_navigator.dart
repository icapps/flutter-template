import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigation.dart';
import 'package:flutter_template/screen/debug/debug_platform_selector_screen.dart';
import 'package:flutter_template/screen/home/home_screen.dart';
import 'package:flutter_template/screen/license/license_screen.dart';
import 'package:flutter_template/screen/login/login_screen.dart';
import 'package:flutter_template/screen/splash/splash_screen.dart';
import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/widget/general/flavor_banner.dart';
import 'package:flutter_template/widget/general/text_scale_factor.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class MainNavigatorWidget extends StatefulWidget {
  final Widget? child;

  const MainNavigatorWidget({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  MainNavigatorWidgetState createState() => MainNavigatorWidgetState();

  static MainNavigationMixin of(BuildContext context, {bool rootNavigator = false}) {
    final navigator = rootNavigator ? context.findRootAncestorStateOfType<MainNavigationMixin>() : context.findAncestorStateOfType<MainNavigationMixin>();
    assert(() {
      if (navigator == null) {
        throw FlutterError('MainNavigation operation requested with a context that does not include a MainNavigation.\n'
            'The context used to push or pop routes from the MainNavigation must be that of a '
            'widget that is a descendant of a MainNavigatorWidget widget.');
      }
      return true;
    }());
    return navigator!;
  }
}

class MainNavigatorWidgetState extends State<MainNavigatorWidget> with MainNavigationMixin {
  static final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  NavigatorState get _navigator => _navigationKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return TextScaleFactor(
      child: widget.child ?? const SizedBox.shrink(),
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final strippedPath = settings.name?.replaceFirst('/', '');
    switch (strippedPath) {
      case '':
      case SplashScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: SplashScreen()), settings: settings);
      case LoginScreen.routeName:
        return FadeInRoute<void>(child: const FlavorBanner(child: LoginScreen()), settings: settings);
      case HomeScreen.routeName:
        return FadeInRoute<void>(child: const FlavorBanner(child: HomeScreen()), settings: settings);
      case TodoAddScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: TodoAddScreen()), settings: settings);
      case DebugPlatformSelectorScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: DebugPlatformSelectorScreen()), settings: settings);
      case LicenseScreen.routeName:
        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: LicenseScreen()), settings: settings);
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return MaterialPageRoute<void>(builder: (context) => FlavorBanner(child: Container(color: Colors.grey)), settings: settings);
      default:
        return null;
    }
  }

  @override
  void goToSplash() => _navigator.pushReplacementNamed(SplashScreen.routeName);

  @override
  void goToLogin() => _navigator.pushReplacementNamed(LoginScreen.routeName);

  @override
  void goToHome() => _navigator.pushReplacementNamed(HomeScreen.routeName);

  @override
  void goToAddTodo() => _navigator.pushNamed(TodoAddScreen.routeName);

  @override
  void goToDebugPlatformSelector() => _navigator.pushNamed(DebugPlatformSelectorScreen.routeName);

  @override
  void goToLicense() => _navigator.pushNamed(LicenseScreen.routeName);

  @override
  void closeDialog() => _navigator.pop();

  @override
  void goToDatabase(GeneratedDatabase db) => _navigator.push<MaterialPageRoute>(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));

  @override
  void goBack<T>({T? result}) => _navigator.pop(result);

  @override
  void showCustomDialog<T>({required WidgetBuilder builder}) =>
      showDialog<T>(context: _navigationKey.currentContext!, builder: builder, useRootNavigator: true);
}

class RouteNames {
  RouteNames._();
  static const debugScreen = 'debug';
  static const debugPlatformSelectorScreen = 'debug_platform_selector';
  static const homeScreen = 'home';
  static const licenseScreen = 'license';
  static const loginScreen = 'login';
  static const splashScreen = 'splash';
  static const todoAddScreen = 'todo_add';
}
