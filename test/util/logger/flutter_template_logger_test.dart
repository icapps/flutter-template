import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/exceptions/internal_server_error.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FlutterTemplateLogger test debug', () async {
    Object output;
    FlutterTemplateLogger.printToConsole = (e) {
      output = e;
    };
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logDebug('isDev');
    expect(output.toString().contains('- isDev'), true);

    FlavorConfig(
      color: Colors.amber,
      name: 'ALPHA',
      flavor: Flavor.ALPHA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isAlpha(), true);
    FlutterTemplateLogger.logDebug('isAlpha');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'BETA',
      flavor: Flavor.BETA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isBeta(), true);
    FlutterTemplateLogger.logDebug('isBeta');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'TEST',
      flavor: Flavor.TEST,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isInTest(), true);
    FlutterTemplateLogger.logDebug('isTest');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'PRODUCTION',
      flavor: Flavor.PROD,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isProd(), true);
    FlutterTemplateLogger.logDebug('isProduction');
    expect(output, null);
  });

  test('FlutterTemplateLogger test logVerbose', () async {
    Object output;
    FlutterTemplateLogger.printToConsole = (e) {
      output = e;
    };
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logVerbose('isDev');

    FlavorConfig(
      color: Colors.amber,
      name: 'ALPHA',
      flavor: Flavor.ALPHA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isAlpha(), true);
    FlutterTemplateLogger.logVerbose('isAlpha');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'BETA',
      flavor: Flavor.BETA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isBeta(), true);
    FlutterTemplateLogger.logVerbose('isBeta');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'TEST',
      flavor: Flavor.TEST,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isInTest(), true);
    FlutterTemplateLogger.logVerbose('isTest');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'PRODUCTION',
      flavor: Flavor.PROD,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isProd(), true);
    FlutterTemplateLogger.logVerbose('isProduction');
    expect(output, null);
  });

  test('FlutterTemplateLogger test logInfo', () async {
    Object output;
    FlutterTemplateLogger.printToConsole = (e) {
      output = e;
    };
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logInfo('isDev');
    expect(output, '💡️ isDev');

    FlavorConfig(
      color: Colors.amber,
      name: 'ALPHA',
      flavor: Flavor.ALPHA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isAlpha(), true);
    FlutterTemplateLogger.logInfo('isAlpha');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'BETA',
      flavor: Flavor.BETA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isBeta(), true);
    FlutterTemplateLogger.logInfo('isBeta');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'TEST',
      flavor: Flavor.TEST,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isInTest(), true);
    FlutterTemplateLogger.logInfo('isTest');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'PRODUCTION',
      flavor: Flavor.PROD,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isProd(), true);
    FlutterTemplateLogger.logInfo('isProduction');
    expect(output, null);
  });

  test('FlutterTemplateLogger test logWarning', () async {
    Object output;
    FlutterTemplateLogger.printToConsole = (e) {
      output = e;
    };
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logWarning('isDev');
    expect(output, '⚠️ isDev');

    FlavorConfig(
      color: Colors.amber,
      name: 'ALPHA',
      flavor: Flavor.ALPHA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isAlpha(), true);
    FlutterTemplateLogger.logWarning('isAlpha');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'BETA',
      flavor: Flavor.BETA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isBeta(), true);
    FlutterTemplateLogger.logWarning('isBeta');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'TEST',
      flavor: Flavor.TEST,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isInTest(), true);
    FlutterTemplateLogger.logWarning('isTest');
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'PRODUCTION',
      flavor: Flavor.PROD,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isProd(), true);
    FlutterTemplateLogger.logWarning('isProduction');
    expect(output, null);
  });

  test('FlutterTemplateLogger test logError', () async {
    Object output;
    FlutterTemplateLogger.printToConsole = (e) {
      output = e;
    };
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logError(message: 'isDev', error: null);
    expect(output, '---⛔ ERROR ⛔---\nisDev\n-----------------\n');
    output = null;
    final error = Error();
    FlutterTemplateLogger.logError(message: 'isDev', error: error);
    expect(output, '---⛔ ERROR ⛔---\nisDev\n$error\n-----------------\n');

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isDev(), true);
    try {
      throw ArgumentError('An error for testing');
    } catch (e) {
      FlutterTemplateLogger.logError(message: 'isDev', error: e);
      // ignore: avoid_as
      expect(output, '---⛔ ERROR ⛔---\nisDev\n$e\n${(e as Error).stackTrace}\n-----------------\n');
    }

    FlavorConfig(
      color: Colors.amber,
      name: 'ALPHA',
      flavor: Flavor.ALPHA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isAlpha(), true);
    FlutterTemplateLogger.logError(message: 'isAlpha', error: null);
    expect(output, null);
    FlutterTemplateLogger.logError(message: 'isAlpha', error: Error());
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'BETA',
      flavor: Flavor.BETA,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isBeta(), true);
    FlutterTemplateLogger.logError(message: 'isBeta', error: null);
    expect(output, null);
    FlutterTemplateLogger.logError(message: 'isBeta', error: Error());
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'TEST',
      flavor: Flavor.TEST,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isInTest(), true);
    FlutterTemplateLogger.logError(message: 'isTest', error: null);
    expect(output, null);
    FlutterTemplateLogger.logError(message: 'isTest', error: Error());
    expect(output, null);

    FlavorConfig(
      color: Colors.amber,
      name: 'PRODUCTION',
      flavor: Flavor.PROD,
      values: null,
    );
    output = null;
    expect(FlavorConfig.isProd(), true);
    FlutterTemplateLogger.logError(message: 'isProduction', error: null);
    expect(output, null);
    FlutterTemplateLogger.logError(message: 'isProduction', error: Error());
    expect(output, null);
  });

  test('FlutterTemplateLogger test logNetworkError', () async {
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: true,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkError(InternalServerError(DioError(
      request: RequestOptions(
        baseUrl: 'https://test.com/',
        path: 'testing',
        method: 'GET',
      ),
    )));

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: true,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkError(InternalServerError(DioError()));

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkError(InternalServerError(DioError()));

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkError(InternalServerError(DioError(response: Response<void>())));
  });

  test('FlutterTemplateLogger test logNetworkRequest', () async {
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: true,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkRequest(
      RequestOptions(
        baseUrl: 'https://test.com/',
        path: 'testing',
        method: 'GET',
      ),
    );

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkRequest(RequestOptions());
  });

  test('FlutterTemplateLogger test logNetworkResponse', () async {
    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: true,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkResponse(Response<dynamic>(
      request: RequestOptions(
        baseUrl: 'https://test.com/',
        path: 'testing',
        method: 'GET',
      ),
    ));

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: const FlavorValues(
        baseUrl: 'https',
        logNetworkInfo: false,
        showFullErrorMessages: false,
      ),
    );
    expect(FlavorConfig.isDev(), true);
    FlutterTemplateLogger.logNetworkResponse(Response<dynamic>());
  });
}
