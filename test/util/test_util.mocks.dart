// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_template/test/util/test_util.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i4;

import 'package:drift/drift.dart' as _i11;
import 'package:flutter/material.dart' as _i1;
import 'package:flutter_template/model/snackbar/snackbar_data.dart' as _i12;
import 'package:flutter_template/navigator/main_navigator.dart' as _i10;
import 'package:flutter_template/util/locale/localization.dart' as _i7;
import 'package:flutter_template/util/snackbar/error_util.dart' as _i9;
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart' as _i3;
import 'package:icapps_architecture/icapps_architecture.dart' as _i8;
import 'package:mockito/mockito.dart' as _i2;
import 'package:mockito/src/dummies.dart' as _i6;

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

/// A class which mocks [GlobalViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockGlobalViewModel extends _i2.Mock implements _i3.GlobalViewModel {
  MockGlobalViewModel() {
    _i2.throwOnMissingStub(this);
  }

  @override
  List<_i4.Locale> get supportedLocales => (super.noSuchMethod(
        Invocation.getter(#supportedLocales),
        returnValue: <_i4.Locale>[],
      ) as List<_i4.Locale>);

  @override
  _i1.ThemeMode get themeMode => (super.noSuchMethod(
        Invocation.getter(#themeMode),
        returnValue: _i1.ThemeMode.system,
      ) as _i1.ThemeMode);

  @override
  bool get showsTranslationKeys => (super.noSuchMethod(
        Invocation.getter(#showsTranslationKeys),
        returnValue: false,
      ) as bool);

  @override
  bool get disposed => (super.noSuchMethod(
        Invocation.getter(#disposed),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i5.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> updateThemeMode(_i1.ThemeMode? themeMode) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateThemeMode,
          [themeMode],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> onSwitchToDutch() => (super.noSuchMethod(
        Invocation.method(
          #onSwitchToDutch,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> onSwitchToEnglish() => (super.noSuchMethod(
        Invocation.method(
          #onSwitchToEnglish,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> onSwitchToSystemLanguage() => (super.noSuchMethod(
        Invocation.method(
          #onSwitchToSystemLanguage,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> setSelectedPlatformToAndroid() => (super.noSuchMethod(
        Invocation.method(
          #setSelectedPlatformToAndroid,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> setSelectedPlatformToIOS() => (super.noSuchMethod(
        Invocation.method(
          #setSelectedPlatformToIOS,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> setSelectedPlatformToDefault() => (super.noSuchMethod(
        Invocation.method(
          #setSelectedPlatformToDefault,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  String getCurrentPlatform() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentPlatform,
          [],
        ),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentPlatform,
            [],
          ),
        ),
      ) as String);

  @override
  String getAppearanceValue(_i7.Localization? localization) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAppearanceValue,
          [localization],
        ),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.method(
            #getAppearanceValue,
            [localization],
          ),
        ),
      ) as String);

  @override
  String getCurrentLanguage() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentLanguage,
          [],
        ),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentLanguage,
            [],
          ),
        ),
      ) as String);

  @override
  bool isLanguageSelected(String? languageCode) => (super.noSuchMethod(
        Invocation.method(
          #isLanguageSelected,
          [languageCode],
        ),
        returnValue: false,
      ) as bool);

  @override
  void toggleTranslationKeys() => super.noSuchMethod(
        Invocation.method(
          #toggleTranslationKeys,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void overrideLocalizations() => super.noSuchMethod(
        Invocation.method(
          #overrideLocalizations,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i4.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i4.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerDispose(_i8.DisposeAware? toDispose) => super.noSuchMethod(
        Invocation.method(
          #registerDispose,
          [toDispose],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerDisposeStream<T>(_i5.StreamSubscription<T>? subscription) =>
      super.noSuchMethod(
        Invocation.method(
          #registerDisposeStream,
          [subscription],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ErrorUtil].
///
/// See the documentation for Mockito's code generation for more information.
class MockErrorUtil extends _i2.Mock implements _i9.ErrorUtil {
  MockErrorUtil() {
    _i2.throwOnMissingStub(this);
  }

  @override
  String? showError({
    required dynamic error,
    required _i1.BuildContext? context,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #showError,
        [],
        {
          #error: error,
          #context: context,
        },
      )) as String?);

  @override
  void showErrorWithLocaleKey({
    required String? messageKey,
    required _i1.BuildContext? context,
    String? titleKey,
    List<dynamic>? args,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showErrorWithLocaleKey,
          [],
          {
            #messageKey: messageKey,
            #context: context,
            #titleKey: titleKey,
            #args: args,
          },
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MainNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockMainNavigator extends _i2.Mock implements _i10.MainNavigator {
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
  _i5.Future<void> goToDatabase(_i11.GeneratedDatabase? db) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToDatabase,
          [db],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

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
  _i5.Future<void> showCustomSnackBar({
    required String? message,
    String? title,
    _i12.SnackBarStyle? style = _i12.SnackBarStyle.neutral,
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
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

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
  _i5.Future<void> goToLicenseScreen({_i1.Key? key}) => (super.noSuchMethod(
        Invocation.method(
          #goToLicenseScreen,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> goToTodoAddScreen({_i1.Key? key}) => (super.noSuchMethod(
        Invocation.method(
          #goToTodoAddScreen,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> goToAnalyticsPermissionScreen({_i1.Key? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToAnalyticsPermissionScreen,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

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
  _i5.Future<void> goToThemeModeSelectorScreen({_i1.Key? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToThemeModeSelectorScreen,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> goToDebugPlatformSelectorScreen({_i1.Key? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #goToDebugPlatformSelectorScreen,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> goToDebugScreen({_i1.Key? key}) => (super.noSuchMethod(
        Invocation.method(
          #goToDebugScreen,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

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
  _i5.Future<T?> showCustomDialog<T>({_i1.Widget? widget}) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {#widget: widget},
        ),
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);

  @override
  _i5.Future<T?> showBottomSheet<T>({_i1.Widget? widget}) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {#widget: widget},
        ),
        returnValue: _i5.Future<T?>.value(),
      ) as _i5.Future<T?>);
}
