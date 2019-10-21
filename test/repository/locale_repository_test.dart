import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/repository/locale_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_kiwi_container.dart';

void main() {
  setUp(() async => TestKiwiContainer.init());

  test('Test Locale Repository default Locale', () async {
    final localeRepo = KiwiContainer.resolve<LocaleRepository>();

    final locale = await localeRepo.getCustomLocale();
    expect(locale, null);
  });

  test('Test Locale Repository save custom locale', () async {
    final localeRepo = KiwiContainer.resolve<LocaleRepository>();

    final defaultLocale = await localeRepo.getCustomLocale();
    expect(defaultLocale, null);

    await localeRepo.setCustomLocale(const Locale('nl'));
    final locale = await localeRepo.getCustomLocale();
    expect(locale, const Locale('nl'));
  });

  test('Test Locale Repository override custom locale', () async {
    final localeRepo = KiwiContainer.resolve<LocaleRepository>();

    final defaultLocale = await localeRepo.getCustomLocale();
    expect(defaultLocale, null);

    await localeRepo.setCustomLocale(const Locale('nl'));
    final locale = await localeRepo.getCustomLocale();
    expect(locale, const Locale('nl'));

    await localeRepo.setCustomLocale(const Locale('en'));
    final newLocale = await localeRepo.getCustomLocale();
    expect(newLocale, const Locale('en'));
  });

  test('Test Locale Repository save custom locale and delete', () async {
    final localeRepo = KiwiContainer.resolve<LocaleRepository>();

    final defaultLocale = await localeRepo.getCustomLocale();
    expect(defaultLocale, null);

    await localeRepo.setCustomLocale(const Locale('nl'));
    final locale = await localeRepo.getCustomLocale();
    expect(locale, const Locale('nl'));

    await localeRepo.setCustomLocale(null);
    final newDefaultLocale = await localeRepo.getCustomLocale();
    expect(newDefaultLocale, null);
  });
}
