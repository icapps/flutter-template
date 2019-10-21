import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/util/locale/localization_delegate.dart';
import 'package:flutter_template/util/locale/localization_fallback_cupertino_delegate.dart';

class TestWrapper extends StatelessWidget {
  final Widget child;
  final bool simulateSafeArea;

  const TestWrapper({
    @required this.child,
    this.simulateSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    const locale = Locale('en');
    return MediaQuery(
      child: Localizations(
        locale: locale,
        delegates: [
          LocalizationDelegate(newLocale: locale, isInTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        child: Center(
          child: RepaintBoundary(child: child),
        ),
      ),
      data: MediaQueryData(padding: simulateSafeArea ? const EdgeInsets.symmetric(vertical: 48) : EdgeInsets.zero),
    );
  }
}
