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
fvm flutter packages pub run icapps_translations
```

## Json Serializable & Kiwi

```
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
fvm flutter packages pub run build_runner watch
```
## Environments

`--release` is not available for emulators. Performance will be better

### Dev, Debug
```
fvm flutter run --flavor dev -t lib/main.dart

fvm flutter run --release --flavor dev -t lib/main.dart
```

### Dummy

Note: a hot reload is required after launch to use the correct launch file.

```
fvm flutter run --flavor dev -t lib/main_dummy.dart

fvm flutter run --release --flavor dev -t lib/main_dummy.dart
```

### Alpha
```
fvm flutter run --flavor alpha -t lib/main_alpha.dart

fvm flutter run --release --flavor alpha -t lib/main_alpha.dart
```

### Beta
```
fvm flutter run --flavor beta -t lib/main_beta.dart

fvm flutter run --release --flavor beta -t lib/main_beta.dart
```

### Prod, Release
```
fvm flutter run --flavor prod -t lib/main_prod.dart

fvm flutter run --release --flavor prod -t lib/main_prod.dart
```

## Niddler

https://github.com/Chimerapps/niddler_dart

Niddler is a network tracing tool written by Nicola Verbeeck.
An Android Studio and Intelij plugin is available to download in the plugin store. (https://plugins.jetbrains.com/plugin/10347-niddler - https://github.com/Chimerapps/niddler-ui)
Niddler is also available for Android & Java (OkHttp: https://github.com/icapps/niddler)

## Linting

To check your code matches our linting. The `analysis_options.yaml` contains all our code checks.

```
flutter analyze
```

## Testing

In order to run our test we need to run

```
fvm flutter test
```

If we want to update our golden files we need to run

```
fvm flutter test --update-goldens
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

Add the provisioning profiles in the ios/provisioning/ folder. The naming of the files should be the same as provided in the `ios/Configuration/{flavor}.xcconfig` files (underscore will be replaced with a space in the configuration files)

#### Firebase

To setup firebase you will need to create a new firebase project with 8 new apps, 1 for each flavor on both iOS and Android. 

When creating the iOS apps on firebase you will be able to download a `GoogleService-Info.plist` file which you will need to rename according to the flavor you just created an app for e.g.: You just created the iOS App for the Dev flavor so your file should be named `GoogleService-Info-dev.plist`. 
Each `.plist` file you download from firebase needs to be placed in the ios/Configuration/GoogleService/ folder. Whenever the project is run with a different flavor from the currently active flavor, it will automatically copy the correct `GoogleService-Info-{flavor}.plist` file into the ios/Runner/ folder.

When creating the Android apps you will be able to download a `google-services.json` file, you only need to download this file once at the end of the last Android app setup on firebase. This `.json` file contains all the configurations for the 4 Android apps which you just created. Add the `.json` file in the android/app/src/ folder.

#### Languages

```
Configure the required languages in Xcode
```

### icapps Translations

```
Update the translations.py file (edit the todos)
```

### Obfuscation

Obfuscation is enabled by default when using fastlane for building. The symbol files are stored in
`./build/debug-info/#{options[:flavor]}`

**Important**: Add the following regex to jenkins configuration to also archive the symbol files
```
**/*.symbols
```

### Icons

Replace the files in the `assets_launcher_icons/**` folder.

You can also change the adaptive_icon_background in the `flutter_launcher_icons-{flavor}.yaml` (currently "#CB2E63") (only available for Android 8.0 devices and above)

After this, run the following command

```
fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml
```

### Common issues

```
No flavor provided
```

Add a flavor to your configuration. Extra info can be found in this issue -> https://github.com/icapps/flutter-template/issues/3

### Questions?

For question contact William Verhaeghe

### Finish

When you have completed this readme. Replace it with the readme for your project.
