import 'package:flutter/material.dart';
import 'package:flutter_template/util/api/dummy_api_util.dart';
import 'package:flutter_template/util/env/flavor_config.dart';
import 'package:flutter_template/util/logger/flutter_template_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    FlutterTemplateLogger.printToConsole = (messaage) {}; //ignore logs
  });

  test('Dummy api util test get response while dummy', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    FlavorConfig(
      color: Colors.amber,
      name: 'DUMMY',
      flavor: Flavor.DUMMY,
      values: null,
    );
    final result = await DummyApiUtil.getResponse<List<dynamic>>('todos');
    expect(result, isNotNull);
  });

  test('Dummy api util test get response while dummy not existing file', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    FlavorConfig(
      color: Colors.amber,
      name: 'DUMMY',
      flavor: Flavor.DUMMY,
      values: null,
    );
    dynamic error;
    try {
      await DummyApiUtil.getResponse<List<dynamic>>('not-existing-dummy-json');
    } catch (e) {
      error = e;
    }
    expect(error, isNotNull);
  });

  test('Dummy api util test get response while test', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    FlavorConfig(
      color: Colors.amber,
      name: 'TEST',
      flavor: Flavor.TEST,
      values: null,
    );
    expect(FlavorConfig.isInTest(), true);
    expect(() async {
      await DummyApiUtil.getResponse<List<dynamic>>('todos');
    }, throwsArgumentError);
  });

  test('Dummy api util test get response while DEV', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    FlavorConfig(
      color: Colors.amber,
      name: 'DEV',
      flavor: Flavor.DEV,
      values: null,
    );
    expect(FlavorConfig.isDev(), true);
    expect(() async {
      await DummyApiUtil.getResponse<List<dynamic>>('todos');
    }, throwsArgumentError);
  });

  test('Dummy api util test get response while ALPHA', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    FlavorConfig(
      color: Colors.amber,
      name: 'ALPHA',
      flavor: Flavor.ALPHA,
      values: null,
    );
    expect(FlavorConfig.isAlpha(), true);
    expect(() async {
      await DummyApiUtil.getResponse<List<dynamic>>('todos');
    }, throwsArgumentError);
  });

  test('Dummy api util test get response while BETA', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    FlavorConfig(
      color: Colors.amber,
      name: 'BETA',
      flavor: Flavor.BETA,
      values: null,
    );
    expect(FlavorConfig.isBeta(), true);
    expect(() async {
      await DummyApiUtil.getResponse<List<dynamic>>('todos');
    }, throwsArgumentError);
  });
}
