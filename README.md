# Flutter Template

[![Build Status](https://app.travis-ci.com/icapps/flutter-template.svg?branch=master)](https://app.travis-ci.com/icapps/flutter-template)
[![Coverage Status](https://coveralls.io/repos/github/icapps/flutter-template/badge.svg)](https://coveralls.io/github/icapps/flutter-template)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

- dependency injection (injectable/get it)
- network layer (dio)
- network logging (niddler, dio)
- viewmodels (provider)
- translations (icapps translations)
- json serialization (json_serializable)
- different environments
- themes
- navigator
- linting (flutter analyze)

## Update the translations

A custom dart program is used for updating the translations

https://pub.dev/packages/icapps_translations

Update your config in the pubspec.yaml
```
icapps_translations:
  api_key: 'enter-your-api-key'
  default_language: 'nl'
  languages: ['en', 'nl']
```

Add your locale folder to your flutter config
```
flutter:
  assets:
    - assets/locale/
```

Command to run to update the translations
```
flutter packages pub run icapps_translations
```

## Json Serializable & Kiwi

```
flutter packages pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch
```
## Environments

`--release` is not available for emulators. Performance will be better

### Dev, Debug
```
flutter run --flavor dev -t lib/main.dart

flutter run --release --flavor dev -t lib/main.dart
```

### Dummy

Note: a hot reload is required after launch to use the correct launch file.

```
flutter run --flavor dev -t lib/main_dummy.dart

flutter run --release --flavor dev -t lib/main_dummy.dart
```

### Alpha
```
flutter run --flavor alpha -t lib/main_alpha.dart

flutter run --release --flavor alpha -t lib/main_alpha.dart
```

### Beta
```
flutter run --flavor beta -t lib/main_beta.dart

flutter run --release --flavor beta -t lib/main_beta.dart
```

### Prod, Release
```
flutter run --flavor prod -t lib/main_prod.dart

flutter run --release --flavor prod -t lib/main_prod.dart
```

## Niddler

https://github.com/Chimerapps/niddler_dart

Niddler is a network tracing tool written by Nicola Verbeeck.
An Android Studio and Intelij plugin is available to download in the plugin store. (https://plugins.jetbrains.com/plugin/10347-niddler - https://github.com/Chimerapps/niddler-ui)
Niddler is also available for Android & Java (OkHttp: https://github.com/icapps/niddler)

## Linting

To check your code matches our linting. The analysis_options.yaml contains all our code checks.

```
flutter analyze
```

## Testing

In order to run our test we need to run

```
flutter test
```

If we want to update our golden files we need to run

```
flutter test --update-goldens
```

## Fastlane

Fastlane is used for building iOS and Android

## Transform this template project

#### Rename this project

This script will run a dart script. The dart script itself will ask you some input to complete the full rename 
```
./tool/rename_project.sh
```

#### Add provisioning files

```
place the provisioning profiles -> provision_profile/**
naming should be the same as provided in the iOS/Configuration/** files (underscore will be replaced with a space in the configuration files)
```

#### Languages

```
Configure the required languages in xCode
```

### icapps Translations

```
Update the translations.py file (edit the todos)
```

### Obfuscation

Obfuscation is enabled by default when using fastlane for building. The symbol files are stored in
`./build/debug-info/#{options[:flavor]}`

**Important**: Add the following regex to jenking configuration to also archive the symbol files
```
**/*.symbols
```

### Icons

Replace the files in assets_launcher_icons/

You can also change the adaptive_icon_background in the flutter_launcher_icons-{flavor}.yaml (currently "#CB2E63") (only available for Android 8.0 devices and above)

After this, run the following command

```
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml
```

### Common issues

```
No Flavor provided
```

Add a flavor to your configuration. Extra info can be found in this issue -> https://github.com/icapps/flutter-template/issues/3

### Questions?

For question contact Koen Van Looveren

### Finish

When you have completed this readme. Replace it with the readme for your project.
