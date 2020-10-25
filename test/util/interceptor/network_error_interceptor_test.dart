import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/exceptions/bad_request_error.dart';
import 'package:flutter_template/model/exceptions/code_error.dart';
import 'package:flutter_template/model/exceptions/flutter_template_error.dart';
import 'package:flutter_template/model/exceptions/forbidden_error.dart';
import 'package:flutter_template/model/exceptions/general_error.dart';
import 'package:flutter_template/model/exceptions/internal_server_error.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/util/connectivity/connectivity_controlling.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/interceptor/network_error_interceptor.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';
import '../../mocks/util/mock_connectivity_controller.dart';

void main() {
  NetworkErrorInterceptor sut;
  MockConnectivityController connectivityController;
  setUp(() async {
    await TestKiwiUtil.init();
    connectivityController = TestKiwiUtil.resolveAs<ConnectivityControlling, MockConnectivityController>();
    sut = NetworkErrorInterceptor(connectivityController);
  });

  group('GeneralError', () {
    test('NetworkErrorInterceptorTest parse general error', () async {
      final dioError = DioError(response: Response<void>(statusCode: 4686845));
      final dynamic newError = await sut.onError(dioError);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, true);
      expect(newError is GeneralNetworkError, true);
      // ignore: avoid_as
      final authorizedError = newError as GeneralNetworkError;
      expect(authorizedError.type, equals(dioError.type));
      expect(authorizedError.error, equals(dioError.error));
      expect(authorizedError.response, equals(dioError.response));
      expect(authorizedError.request, equals(dioError.request));
      expect(authorizedError.getLocalizedKey(), LocalizationKeys.errorGeneral);
    });
  });

  group('UnAuthorizedError', () {
    test('NetworkErrorInterceptorTest parse 401 error', () async {
      final dioError = DioError(response: Response<void>(statusCode: 401));
      final dynamic newError = await sut.onError(dioError);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, true);
      expect(newError is UnAuthorizedError, true);
      // ignore: avoid_as
      final authorizedError = newError as UnAuthorizedError;
      expect(authorizedError.type, equals(dioError.type));
      expect(authorizedError.error, equals(dioError.error));
      expect(authorizedError.response, equals(dioError.response));
      expect(authorizedError.request, equals(dioError.request));
      expect(authorizedError.getLocalizedKey(), LocalizationKeys.errorUnauthorized);
    });
  });

  group('InternalServerError', () {
    test('NetworkErrorInterceptorTest parse 500 error', () async {
      final dioError = DioError(response: Response<void>(statusCode: 500));
      final dynamic newError = await sut.onError(dioError);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, true);
      expect(newError is InternalServerError, true);
      // ignore: avoid_as
      final authorizedError = newError as InternalServerError;
      expect(authorizedError.type, equals(dioError.type));
      expect(authorizedError.error, equals(dioError.error));
      expect(authorizedError.response, equals(dioError.response));
      expect(authorizedError.request, equals(dioError.request));
      expect(authorizedError.getLocalizedKey(), LocalizationKeys.errorInternalServer);
    });
  });

  group('Forbidden Error', () {
    test('NetworkErrorInterceptorTest parse 403 error', () async {
      final dioError = DioError(response: Response<void>(statusCode: 403));
      final dynamic newError = await sut.onError(dioError);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, true);
      expect(newError is ForbiddenError, true);
      // ignore: avoid_as
      final authorizedError = newError as ForbiddenError;
      expect(authorizedError.type, equals(dioError.type));
      expect(authorizedError.error, equals(dioError.error));
      expect(authorizedError.response, equals(dioError.response));
      expect(authorizedError.request, equals(dioError.request));
      expect(authorizedError.getLocalizedKey(), LocalizationKeys.errorForbidden);
    });

    test('NetworkErrorInterceptorTest parse 403 error with unknown code 45648', () async {
      final data = <String, dynamic>{};
      data['code'] = '45648';
      final dioError = DioError(response: Response<Map<String,dynamic>>(statusCode: 403, data: data));
      final dynamic newError = await sut.onError(dioError);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, true);
      expect(newError is ForbiddenError, true);
      // ignore: avoid_as
      final authorizedError = newError as ForbiddenError;
      expect(authorizedError.response, equals(dioError.response));
      expect(authorizedError.request, equals(dioError.request));
      expect(authorizedError.error, equals(dioError.error));
      expect(authorizedError.type, equals(dioError.type));
      expect(authorizedError.getLocalizedKey(), LocalizationKeys.errorForbidden);
    });
  });
  group('BadRequestError', () {
    test('NetworkErrorInterceptorTest parse 400 error', () async {
      final dioError = DioError(response: Response<void>(statusCode: 400));
      final dynamic newError = await sut.onError(dioError);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, true);
      expect(newError is BadRequestError, true);
      // ignore: avoid_as
      final authorizedError = newError as BadRequestError;
      expect(authorizedError.response, equals(dioError.response));
      expect(authorizedError.request, equals(dioError.request));
      expect(authorizedError.error, equals(dioError.error));
      expect(authorizedError.type, equals(dioError.type));
      expect(authorizedError.getLocalizedKey(), LocalizationKeys.errorBadRequest);
    });
  });

  group('Code Error', () {
    test('NetworkErrorInterceptorTest code error', () async {
      final dynamic newError = await sut.onError(null);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, false);
      expect(newError is CodeError, true);
      // ignore: avoid_as
      final codeError = newError as CodeError;
      expect(codeError.getLocalizedKey(), LocalizationKeys.errorGeneral);
    });

    test('NetworkErrorInterceptorTest code error during development', () async {
      const values = FlavorValues(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      );
      FlavorConfig(
        flavor: Flavor.DEV,
        color: Colors.purple,
        name: 'Test',
        values: values,
      );
      final dynamic newError = await sut.onError(null);
      expect(newError is FlutterTemplateError, true);
      expect(newError is DioError, false);
      expect(newError is CodeError, true);
      // ignore: avoid_as
      final codeError = newError as CodeError;
      expect(codeError.getLocalizedKey(), LocalizationKeys.errorDuringDev);
    });
  });
}
