import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/bloc/global/global_cubit.dart';
import 'package:flutter_template/bloc/select_language/select_language_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_kiwi_util.dart';

void main() {
  GlobalBloc globalBloc;
  setUp(() async {
    await TestKiwiUtil.init();
    globalBloc = TestKiwiUtil.resolve<GlobalBloc>();
  });

  tearDown(() {
    globalBloc?.close();
  });

  final states = [
    const InitialSelectLanguageState(Locale('en')),
    const InitialSelectLanguageState(null),
    const InitialSelectLanguageState(Locale('nl')),
  ];

  group('SelectLanguageBloc', () {
    final events = [
      const ChangeSelectedLanguageEvent(Locale('en')),
      const ChangeSelectedLanguageEvent(null),
      const ChangeSelectedLanguageEvent(Locale('nl')),
    ];
    blocTest<SelectLanguageBloc, SelectLanguageState>(
      'emits [] when nothing is added',
      build: () => SelectLanguageBloc(globalBloc: null),
      expect: const <SelectLanguageState>[],
    );

    blocTest<SelectLanguageBloc, SelectLanguageState>(
      'emits [ChangeSelectedLanguageEvent(Locale("en"))] when ChangeSelectedLanguageEvent(Locale("en")) is added',
      build: () {
        return SelectLanguageBloc(globalBloc: null);
      },
      act: (bloc) async => bloc.add(const ChangeSelectedLanguageEvent(Locale('en'))),
      expect: const <SelectLanguageState>[InitialSelectLanguageState(Locale('en'))],
    );

    blocTest<SelectLanguageBloc, SelectLanguageState>(
      'emits [states] when events are added',
      build: () => SelectLanguageBloc(globalBloc: null),
      act: (bloc) async => events.forEach(bloc.add),
      expect: states,
    );
  });

  group('SelectLanguageBloc with globalBloc', () {
    final events = [
      const ChangeLanguageGlobalEvent(Locale('en')),
      const ChangeLanguageGlobalEvent(null),
      const ChangeLanguageGlobalEvent(Locale('nl')),
    ];

    blocTest<SelectLanguageBloc, SelectLanguageState>(
      'emits [states] when events are added',
      build: () => SelectLanguageBloc(globalBloc: globalBloc),
      act: (bloc) async => events.forEach(globalBloc.add),
      expect: states,
    );
  });
}
