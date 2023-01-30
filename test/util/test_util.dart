import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/architecture.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_fonts.dart';
import 'package:flutter_template/util/locale/localization.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flutter_template/util/snackbar/error_util.dart';
import 'package:flutter_template/util/theme/theme_config.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:mockito/annotations.dart';

import '../mocks/mocked_network_images.dart';
import '../screen/seed.dart';
import '../widget/test_app.dart';
import 'test_screen_type.dart';
import 'test_util.mocks.dart';

@GenerateMocks([
  GlobalViewModel,
  ErrorUtil,
  MainNavigator,
])
class TestUtil {
  // This method should be used when taking screenshot tests of a widget that should not display text
  // Widget snapshot tests
  static Future<Widget> loadWidget(WidgetTester tester, Widget widget, {ThemeMode themeMode = ThemeMode.light}) async {
    return _internalLoadWidget(tester, Center(child: widget), themeMode);
  }

  // This method should be used when taking screenshot tests of a widget that should display text
  // Widget snapshot tests
  static Future<Widget> loadWidgetWithText(WidgetTester tester, Widget widget, {ThemeMode themeMode = ThemeMode.light}) async {
    return _internalLoadWidget(
      tester,
      MaterialApp(
        theme: ThemeData(fontFamily: ThemeFonts.body),
        locale: const Locale('en'),
        supportedLocales: const [Locale('en')],
        localizationsDelegates: [
          LocalizationDelegate(showLocalizationKeys: true),
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        home: Center(
          child: Material(
            color: Colors.transparent,
            child: widget,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
      themeMode,
    );
  }

  // This method should be used when taking screenshot tests of a single screen
  // Screen integration tests
  static Future<Widget> loadScreen(WidgetTester tester, Widget widget, {ThemeMode themeMode = ThemeMode.light}) async {
    await initArchitecture();
    if (getIt.isRegistered<GlobalViewModel>()) {
      staticLogger.debug('GlobalViewModel already registered');
    } else {
      getIt.registerLazySingleton<GlobalViewModel>(() => MockGlobalViewModel());
      seedGlobalViewModel();
    }
    return _internalLoadWidget(
      tester,
      TestApp(
        home: widget,
        localeDelegate: LocalizationDelegate(showLocalizationKeys: true),
      ),
      themeMode,
    );
  }

  // This method should be used when taking screenshot tests of the full app
  // Full integration tests
  static Future<Widget> loadFlutterTemplateApp(WidgetTester tester, {ThemeMode themeMode = ThemeMode.light}) async {
    return _internalLoadWidget(tester, const MyApp(), themeMode);
  }

  static T _getTheme<T>(BuildContext context) => FlutterTemplateTheme.of(context) as T;

  static L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

  static Future<Widget> _internalLoadWidget(WidgetTester tester, Widget widget, ThemeMode themeMode) async {
    localizationLookup = _getLocale;
    themeLookup = _getTheme;
    _configureTheme(themeMode);
    await _loadFonts();
    final testWidget = TestWrapper(child: widget);
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(testWidget);
    });
    await tester.pumpAndSettle();
    return testWidget;
  }

  static Future<void> takeScreenshotForAllSizes(WidgetTester tester, Widget widget, String snapshotName) async {
    for (final screen in ScreenType.values) {
      await takeScreenshotForScreenType(tester, widget, snapshotName, screen: screen);
    }
  }

  static Future<void> takeScreenshotForScreenType(WidgetTester tester, Widget widget, String snapshotName, {ScreenType screen = ScreenType.iPhone11}) async {
    tester.binding.window.physicalSizeTestValue = screen.size;
    expect(widget.runtimeType, equals(TestWrapper));
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    await takeScreenshot(tester, '${snapshotName}_${screen.name}');
    tester.binding.window.clearPhysicalSizeTestValue();
  }

  static Future<void> takeScreenshot(WidgetTester tester, String snapshotName) async {
    expect(find.byType(TestWrapper), findsOneWidget);
    await expectLater(
      find.byType(TestWrapper),
      matchesGoldenFile('img/$snapshotName.png'),
    );
  }

  static Future<void> pumpAndSettleWithDuration(WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  static Future<void> _loadFonts() async {
    await _loadFont('assets/fonts/open_sans/OpenSans-Regular.ttf', ThemeFonts.body);
  }

  static Future<void> _loadFont(String fontPath, String fontName) async {
    File fontFile;
    //Thanks android studio to run the tests from root instead of /test
    if (Directory.current.path.endsWith('test')) {
      fontFile = File('../$fontPath');
    } else {
      fontFile = File(fontPath);
    }
    final bytes = fontFile.readAsBytesSync();
    final fontData = ByteData.view(bytes.buffer);
    final fontLoader = FontLoader(fontName)..addFont(Future.value(fontData));
    await fontLoader.load();
  }

  static String getVariableString() {
    return 'Title';
  }

  static void _configureTheme(ThemeMode themeMode) {
    ThemeConfigUtil themeConfig;
    if (getIt.isRegistered<ThemeConfigUtil>()) {
      themeConfig = getIt();
    } else {
      themeConfig = ThemeConfigUtil();
      getIt.registerSingleton(themeConfig);
    }
    themeConfig.themeMode = themeMode;
  }
}

class TestWrapper extends StatelessWidget {
  final Widget child;

  const TestWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RepaintBoundary(
        child: child,
      ),
    );
  }
}

class TextFinder extends MatchFinder {
  TextFinder(this.text, {this.substring = false, super.skipOffstage});

  final String text;
  final bool substring;

  @override
  String get description => 'text "$text"';

  @override
  bool matches(Element candidate) {
    final widget = candidate.widget;
    if (widget is Text) {
      if (widget.data != null) {
        return substring ? widget.data!.contains(text) : widget.data == text;
      }
      assert(widget.textSpan != null);
      return substring ? widget.textSpan!.toPlainText().contains(text) : widget.textSpan!.toPlainText() == text;
    } else if (widget is EditableText) {
      return substring ? widget.controller.text.contains(text) : widget.controller.text == text;
    }
    return false;
  }
}
