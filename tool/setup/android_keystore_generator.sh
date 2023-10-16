#!/bin/bash
alias="android"
mkdir -p android/keystore

echo "Creating a debug keystore"
debugKeystorePath="android/keystore/debug.keystore"
debugPassword=$(uuidgen)
keytool -genkey -keystore $debugKeystorePath -keyalg RSA -alias $alias -storepass "$debugPassword" -keypass "$debugPassword" -validity 365000
dart run tool/dart_tool/android_keystore_generator.dart "debug" "$alias" "$debugPassword"

echo "Creating a release keystore"
releaseKeystorePath="android/keystore/release.keystore"
releasePassword=$(uuidgen)
keytool -genkey -keystore $releaseKeystorePath -keyalg RSA -alias $alias -storepass "$releasePassword" -keypass "$releasePassword" -validity 365000
dart run tool/dart_tool/android_keystore_generator.dart "release" "$alias" "$releasePassword"