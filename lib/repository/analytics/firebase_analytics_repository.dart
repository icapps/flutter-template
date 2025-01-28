import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/repository/analytics/analytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class FireBaseAnalyticsRepository implements Analytics {
  @factoryMethod
  factory FireBaseAnalyticsRepository(FirebaseAnalytics analytics) = _FireBaseAnalyticsRepository;

  RouteObserver get routeObserver;
}

class _FireBaseAnalyticsRepository with WidgetsBindingObserver implements FireBaseAnalyticsRepository {
  final FirebaseAnalytics _analytics;

  @override
  RouteObserver<Route> get routeObserver => FirebaseAnalyticsObserver(analytics: _analytics);

  _FireBaseAnalyticsRepository(this._analytics);

  @override
  void init() {
    _analytics.logAppOpen();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void trackEvent(String name, {Map<String, Object?>? arguments}) => _analytics.logEvent(
        name: name,
        parameters: _parseParameters(arguments),
      );

  Map<String, Object>? _parseParameters(Map<String, Object?>? options) {
    if (options == null) return null;
    final parsedOptions = options..removeWhere((key, value) => value == null);
    return parsedOptions.map((key, value) => MapEntry(key, value!));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _analytics.logAppOpen();
    } else if (state == AppLifecycleState.paused) {
      _analytics.logEvent(name: Analytics.eventAppBackground);
    }
  }

  @override
  void dispose() => WidgetsBinding.instance.removeObserver(this);

  @override
  void onLoggedIn() => _analytics.logLogin();

  @override
  void onSignedUp() => _analytics.logSignUp(signUpMethod: 'email');
}
