// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/viewmodel/splash/splash_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter/material.dart' as _i4;
import 'package:flutter_template/navigator/onboarding_navigator.dart' as _i5;
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorage extends _i1.Mock implements _i2.LocalStorage {
  MockLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> checkForNewInstallation() => (super.noSuchMethod(
        Invocation.method(
          #checkForNewInstallation,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateThemeMode(_i4.ThemeMode? themeMode) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateThemeMode,
          [themeMode],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateHasAnalyticsPermission(bool? permissionGranted) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateHasAnalyticsPermission,
          [permissionGranted],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [OnboardingNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnboardingNavigator extends _i1.Mock
    implements _i5.OnboardingNavigator {
  MockOnboardingNavigator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> goToNextScreen() => (super.noSuchMethod(
        Invocation.method(
          #goToNextScreen,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
