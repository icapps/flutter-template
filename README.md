# Flutter Template

This is an icapps template project to get started with Flutter quickly

## Provided in the repo

- dependency injection (kiwi)
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
```
.translations.py
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
An Android Studio and Intelij plugin is available to download in the plugin store. (https://plugins.jetbrains.com/plugin/10347-niddler - https://github.com/icapps/niddler-ui)
Niddler is also available for Android & Java (OkHttp: https://github.com/icapps/niddler)

## Linting

To check your code matches our linting. The analysis_options.yaml contains all our code checks.

```
flutter analyze
```

## Fastlane

Fastlane is used for building iOS and Android

## Transform this template project

### Fastelane

#### fastlane/Fastfile

```
private_lane :convertAppToIpa do |options|
    Dir.chdir "ios" do
        gym(
            workspace: WORKSPACE,
            scheme: options[:flavor],
            configuration: "Release-#{options[:flavor]}",
            export_options: {
                method: "enterprise",
                provisioningProfiles: {
                    "com.icapps.fluttertemplate.dev" => "Flutter Template Debug", //TODO edit this
                    "com.icapps.fluttertemplate.alpha" => "Flutter Template Alpha", //TODO edit this
                    "com.icapps.fluttertemplate.beta" => "Flutter Template Beta", //TODO edit this
                    "com.icapps.fluttertemplate" => "Flutter Template Production" //TODO edit this
                }
            }
        )
    end
end
```


### Android

#### android/app/src/main/AndroidManifest.xml

```
update the package name
```

#### android/app/build.gradle

```
update the package name
```

#### android/app/src/main/kotlin/...

```
update folder structure with matching packagename
```


#### Add app icons

```
Add app icons for each flavor
```

### iOS

#### ios/Configuration/Shared.xconfig

```
Add the development team
```

#### ios/Configuration/Shared.xconfig

```
Add the development team
```

#### ios/Configuration/**

```
Edit the configuration files so every config is correct added
```

#### bundle identifier

```
Update the bundle identifier in xCode
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

For question contact Koen Van Looveren

When you have completed this readme. Replace it with the readme for your project.