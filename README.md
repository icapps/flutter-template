# Flutter Template

This is an icapps template project to get started with Flutter quickly

## Provided in the repo

- dependency injection (kiwi)
- network layer (dio)
- viewmodels (provider)
- translations (icapps translations)
- json serialization (json_serializable)
- different environments
- themes
- navigator

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

#### app/src/main/AndroidManifest.xml

```
update the package name
```

#### app/build.gradle

```
update the package name
```

#### app/src/main/kotlin/...

```
update folder structure with matching packagename
```


#### Add app icons

```
Add app icons for each flavor
```

### iOS

For question contact Koen Van Looveren