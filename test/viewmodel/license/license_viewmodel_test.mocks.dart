// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/viewmodel/license/license_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:drift/drift.dart' as _i5;
import 'package:flutter/material.dart' as _i1;
import 'package:flutter_template/model/snackbar/snackbar_data.dart' as _i6;
import 'package:flutter_template/navigator/main_navigator.dart' as _i3;
import 'package:mockito/mockito.dart' as _i2;

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

class _FakeGlobalKey_0<T extends _i1.State<_i1.StatefulWidget>>
    extends _i2.SmartFake implements _i1.GlobalKey<T> {
  _FakeGlobalKey_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MainNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockMainNavigator extends _i2.Mock implements _i3.MainNavigator {
  MockMainNavigator() {
    _i2.throwOnMissingStub(this);
  }

  @override
  _i1.GlobalKey<_i1.NavigatorState> get navigatorKey => (super.noSuchMethod(
        Invocation.getter(#navigatorKey),
        returnValue: _FakeGlobalKey_0<_i1.NavigatorState>(
          this,
          Invocation.getter(#navigatorKey),
        ),
      ) as _i1.GlobalKey<_i1.NavigatorState>);

  @override
  _i4.Future<void> goToDatabase(_i5.GeneratedDatabase? db) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToDatabase,
          [db],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void showErrorWithLocaleKey({
    required String? messageKey,
    String? titleKey,
    List<dynamic>? args,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showErrorWithLocaleKey,
          [],
          {
            #messageKey: messageKey,
            #titleKey: titleKey,
            #args: args,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void showError(dynamic error) => super.noSuchMethod(
        Invocation.method(
          #showError,
          [error],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> showCustomSnackBar({
    required String? message,
    String? title,
    _i6.SnackBarStyle? style = _i6.SnackBarStyle.neutral,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSnackBar,
          [],
          {
            #message: message,
            #title: title,
            #style: style,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i1.Route<dynamic>? onGenerateRoute(_i1.RouteSettings? settings) =>
      (super.noSuchMethod(Invocation.method(
        #onGenerateRoute,
        [settings],
      )) as _i1.Route<dynamic>?);

  @override
  void goToHomeScreen({_i1.Key? key}) => super.noSuchMethod(
        Invocation.method(
          #goToHomeScreen,
          [],
          {#key: key},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToSplashScreen({_i1.Key? key}) => super.noSuchMethod(
        Invocation.method(
          #goToSplashScreen,
          [],
          {#key: key},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> goToLicenseScreen({_i1.Key? key}) => (super.noSuchMethod(
        Invocation.method(
          #goToLicenseScreen,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> goToTodoAddScreen({_i1.Key? key}) => (super.noSuchMethod(
        Invocation.method(
          #goToTodoAddScreen,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> goToAnalyticsPermissionScreen({_i1.Key? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToAnalyticsPermissionScreen,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void goToLoginScreen({_i1.Key? key}) => super.noSuchMethod(
        Invocation.method(
          #goToLoginScreen,
          [],
          {#key: key},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> goToThemeModeSelectorScreen({_i1.Key? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToThemeModeSelectorScreen,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> goToDebugPlatformSelectorScreen({_i1.Key? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToDebugPlatformSelectorScreen,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> goToDebugScreen({_i1.Key? key}) => (super.noSuchMethod(
        Invocation.method(
          #goToDebugScreen,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void goBack() => super.noSuchMethod(
        Invocation.method(
          #goBack,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goBackWithResult<T>({T? result}) => super.noSuchMethod(
        Invocation.method(
          #goBackWithResult,
          [],
          {#result: result},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popUntil(bool Function(_i1.Route<dynamic>)? predicate) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goBackTo(String? routeName) => super.noSuchMethod(
        Invocation.method(
          #goBackTo,
          [routeName],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<T?> showCustomDialog<T>({_i1.Widget? widget}) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {#widget: widget},
        ),
        returnValue: _i4.Future<T?>.value(),
      ) as _i4.Future<T?>);

  @override
  _i4.Future<T?> showBottomSheet<T>({_i1.Widget? widget}) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {#widget: widget},
        ),
        returnValue: _i4.Future<T?>.value(),
      ) as _i4.Future<T?>);
}
