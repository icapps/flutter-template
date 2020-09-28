part of 'global_cubit.dart';

abstract class GlobalState extends Equatable {
  final Locale locale;
  final TargetPlatform targetPlatform;
  final bool showsTranslationKeys;
  final bool slowAnimationsEnabled;
  final LocalizationDelegate localizationDelegate;

  const GlobalState({
    this.locale,
    this.targetPlatform,
    this.showsTranslationKeys,
    this.slowAnimationsEnabled,
    this.localizationDelegate,
  });

  @override
  List<Object> get props => [
        locale,
        targetPlatform,
        showsTranslationKeys,
        slowAnimationsEnabled,
        localizationDelegate,
      ];
}

class InitialGlobalState extends GlobalState {}

class LoadedGlobalState extends GlobalState {
  const LoadedGlobalState({
    locale,
    targetPlatform,
    showsTranslationKeys,
    slowAnimationsEnabled,
    localizationDelegate,
  }) : super(
          locale: locale,
          targetPlatform: targetPlatform,
          showsTranslationKeys: showsTranslationKeys,
          slowAnimationsEnabled: slowAnimationsEnabled,
          localizationDelegate: localizationDelegate,
        );
}

class LoadingGlobalState extends GlobalState {}

class LoadingFailedGlobalState extends GlobalState {}
